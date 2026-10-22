Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891A2606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Oct 2026 14:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0r+cCssb;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=Yf0b4hsM;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=gB1d/J5L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=9ejw1kEAdsdZspPEoWHlWSDGgAnEWhYDeRavXIDNvZY=; b=0r+cCssbnGB3RM
	PSB4SDd6Nxy2dZoozlBVlLrQVAMR59p0DP1NXa22uTy8DUVP1j+i8CaxKMtEL+jiUKxONmy1DBbSI
	m5P6CxqC9eUtgqahv3EWYV3/kmz43zr4eciG1g8dBOxUCjJmREeAILyjKeDm3JpNNLRsUF6H22yPl
	dI8R8u5fPEjFb3G1qfjr2ews1NC/rS6uRHnyJlZjbasIsJC8eK8stRjo4RTauWjBGCz7PUGndqRoj
	BqJnSnVf483RdkahJQ5F0LhOe5tAUwV0jNCQ+RSXa+h3hH0DIb8cHyxCJQIuwQYLGLjsmVqpq0ZD4
	zh89yYswZQ+nSvTDuTHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJu4h-0000000ELGU-3LMM;
	Thu, 22 Oct 2026 14:47:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJu4c-0000000ELFP-2XTK
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 22 Oct 2026 14:47:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=9ejw1kEAdsdZspPEoWHlWSDGgAnEWhYDeRavXIDNvZY=; b=Yf0b4hsMdKPfUqSQlUU9rk723M
	KwZbUvoP48UK1pxb65+w1fTI1izeWGecGCEbHQfue87bLT8csqd6LbBbRwMmc0T8b7Xjl3as16c8z
	s8t1xG4DFdEfU7ZnY7qCNEgjf05EKIOa6ir6DKsjAnLVUcL8mfKs49YTCkq6XrkBOj+q6cQJBlYeH
	C2qAZ3ZYC8pD+RTxgHZteqQaFpE28NyqcH17j/HmfTtXow9Ef1fK87f6f0KugzKxm59Lxfad8bjF+
	xjHaPnzQMqvAV80UWjrXJ/gesJ/RNjY2TX1BswgRgT7OYb+VbwUtXheI+h2lSAyfx9kXS2qYxEhQ7
	PZzft9gg==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJu4C-00000007KpI-2RuJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Oct 2026 14:47:17 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-48bbb06e746so1215863f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 07:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792680411; x=1793285211; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9ejw1kEAdsdZspPEoWHlWSDGgAnEWhYDeRavXIDNvZY=;
        b=gB1d/J5LHvbWKUJdb0l1fqSPE07DuoLZFhBpKBdY83Exd5/kFSHXQAgkIkDqVNYp0l
         RcwoM+uvvXVZELgH9nweo9cOi01plW38zvmqLF1ypHcZ5NR5AQBSiWlJhwTOFX986Arv
         afFoVdJTNin+1IkHArlKFzfhY/hHINorbz6ditbk8LD/siAiMar/Fm4I8QA5KsoGP9jj
         b44yBCknpiInJhwRmrost1/KZFGXU8A9O0gyRqQWZLHjllb4es3ekwojhCwYpLqWOwoS
         8Pcxwr605pNedLsNsN7Me0ybBTvidxaBrYRPuhbLjocs/arVT8rtJjxkSMwT2agYHrSU
         rVjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680411; x=1793285211;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9ejw1kEAdsdZspPEoWHlWSDGgAnEWhYDeRavXIDNvZY=;
        b=bfmJWGDs1TYyOgix0NUsjOmRrzvEp0NvwjzTv+rb0p/145HobDYggocZ5HRgE8hhby
         FCMwaFDtkAcSTnnD/YlbvDJ4mF9zipJS3htFjcNMGDoFeDDdC7FShipDJBCmr/s/KzQx
         sJRw3QOmuk/RIVmpKzAGy6gA88G69LBe2zyUEvj7AuEoTwoWak8JXK8vHloTJBqlRU6W
         mW6mIzZgcqXTfp2JwDTbGnumT6cKSHbTmSjU+TYMnBjm6WkGk8fuuVOTsV5Z1JWMo+qo
         kVKLxnN7/uojwOpT0kOBqMkf/WMSBNBiBeqgFTXZd/CuGbPpsZl8DPzb1/i0HKu3BgVY
         ZSpA==
X-Forwarded-Encrypted: i=1; AKwUvBz0BpdhGYbNW3ZgIfTI28lK2ztwjLiWPDPKtOL/SyUbxi12U/EjRo3awlRcWh7hoE8okuPQpBZ52LAIqtapZcV7@lists.infradead.org
X-Gm-Message-State: AFq9FYJ+/7fJmniRLrgUIT9jgRrlXpdEZyPB1DCLeoQNB2FsU/0pXScq
	VWdrFEhzfr1R68adzsZygohn4hfWkh6h97M32tILCxsZiYTLKT58awt7ch3hNQzp
X-Gm-Gg: AYBFou1mAwKugsB+Vt7MAdhEiRGb4qvDfxg5hYR399rPghzDBKVdhRlKqK1g5MZ+q2R
	E/fcTtnhEMSiHnXS6OeJIA/VayyH/IWhi45syhm+qZQZr69INr9JiCDwnCxwu/ZyDptyu5Hc+rL
	7ogxi0y2c24vePPNWzMEyE1hJOa7L2tvdkwXHkgFKvmuPLgXTm8ygSDfuAC5wqyC5WbLe2RvchZ
	PtY0AQ2Fvacqk66ZZ9b1M3UQtBnYZkJNezbkuWlLpTFbSANXOkiraKrWRnx2lqEuBcC22gn0YDH
	bb85cNeWFI7DipPBBwJ6Yp/aeuPUf2YsuMeSZ+ps/D9h6dcQ2yy91dg7avanF97H6BfXQDfT1cA
	oRVkYiu8AtEmOTn57IXSkqdASaIHkgrgqc0eEeqNs3lVBS8wCsXwaOSo32AqD9R7DwtSZQkUBHD
	7U13/97nZJQmZ9tgu4J3N9/Ag3FC4GKVMqiH1OOBmSXbpeqTZfMLzdsewP34NPqpAUIXGtlZ4+B
	w4Yv0f+4Vy3fa/uWuwpoQTHiPdsMpwmjOvmUWcY5b4Ym09KPCLD+KA1+YKt/lZm5OpBYH+Ewa9/
	xfb+3M1bg6L0STBV+pYPZrxWYV2kMEJUkf6Wr34551YytJvwde4lrJv0yk1iy7AfOCG/0oR3RCo
	s
X-Received: by 2002:a05:6000:2c0d:b0:48e:d36:77 with SMTP id ffacd0b85a97d-48e2644f155mr11067241f8f.4.1792680410751;
        Thu, 22 Oct 2026 07:46:50 -0700 (PDT)
Received: from ernest.hoecke-nb (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch. [83.173.201.248])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e25828c6dsm13672146f8f.24.2026.10.22.07.46.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:46:50 -0700 (PDT)
From: Ernest Van Hoecke <ernestvanhoecke@gmail.com>
Date: Thu, 22 Oct 2026 16:46:44 +0200
Subject: [PATCH v2 1/3] arm64: dts: freescale: imx8mp-toradex-smarc: Add
 on-carrier 3.3V regulator
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-v1-smarc-imx8mp-cameras-v2-1-cfe3d25e7aed@toradex.com>
References: <20261022-v1-smarc-imx8mp-cameras-v2-0-cfe3d25e7aed@toradex.com>
In-Reply-To: <20261022-v1-smarc-imx8mp-cameras-v2-0-cfe3d25e7aed@toradex.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_154653_702473_2B7002CE 
X-CRM114-Status: GOOD (  10.83  )
X-Spam-Score: -0.2 (/)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>

Describe the fixed 3.3 V rail of the Toradex SMARC Development Board as
a regulator, like the existing on-carrier 1.8 V rail, so it can be
referenced as a supply by the devices it powers.

Signed-off-by: Ernest Van Hoecke <ernest.vanhoecke@toradex.com>
---
 arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
index b31de307093c..c28d63293149 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-toradex-smarc-dev.dts
@@ -32,6 +32,13 @@ reg_carrier_1p8v: regulator-carrier-1p8v {
 		regulator-name = "On-carrier 1V8";
 	};
 
+	reg_carrier_3p3v: regulator-carrier-3p3v {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "On-carrier 3V3";
+	};
+
 	sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,bitclock-master = <&codec_dai>;

-- 
2.43.0


