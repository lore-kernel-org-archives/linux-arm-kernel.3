Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C95A5606C22D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 09:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E+BVuOy7;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AiCMRiXh
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tOz2JFjjkTi3TUHkJpJV4spG7QQFNKVaT1zkl6n7spk=; b=E+BVuOy7N5B7pB
	S9KoCCyQBLBEDb62FDoy3KLKPJu2zL4J2DPteXaRxqXVDVb+nTrhYo5QTSUy2EEglkJpH6ofZ1IQA
	/1CnzRAaMFtGsCkSxefPnjihhTYSKE63KK1U7AuKS5F+e2s05UVKJYHrDlfiREvYa1tIrukHFNxyL
	PBhIDVrrFWjY20z8vqF3mRAwXA28CnxGwZYbe1wj1odG/8j4e8ALSKlyxD202GuVfpXlZjMjZHn5a
	InxF6n/xJfgRQqTQ4IQDGWpiCxE/vy9aUPX3f/zMXJJxTp0T/Vr7h8QfQLiGx25xT+G0GxELEuMxF
	DnYA0gvRa/6WbJIMdfOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSj-000000029bv-2Lx0;
	Mon, 26 Oct 2026 09:57:53 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHSd-000000029R2-0lgX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 09:57:48 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so17312915e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 02:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793008665; x=1793613465; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tOz2JFjjkTi3TUHkJpJV4spG7QQFNKVaT1zkl6n7spk=;
        b=AiCMRiXhL7GIHj7IyJANX4uRjX17krhGDFuHqXwwFyd4kn/8ppWJadjMa/qFdAWfzl
         DROasGnkBnQ5QvbxgCRehTt+DlTG82LocZxveq2+M2cH85e74AbE1COTwnjoEGHEFFXN
         e4x3IF4iFgmuEJGWB58tMozrLjPcm64P1J16ONccY6FAfLmiC0my6GLw0KJSUOVHpvBm
         Oq+JBxrPhd1/BtpMoWgGe1Y1N1kOqJitV0RPwFKZM3k0EJzJnLclhicRCQ8Am0QJwF4u
         vwFQW8gBUHC9f1w3rLuwnawC7G9dwxEDJXylrq9gp0d1DNLP0MziE+Wmm5SQ3yzq5XM+
         jTlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793008665; x=1793613465;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tOz2JFjjkTi3TUHkJpJV4spG7QQFNKVaT1zkl6n7spk=;
        b=mTSAWLOKj9nFeL9U/ZRSbaqOyg2I/yXeG7FDIkYOJz4yCWl+M7d4d6+lc1sd+cD+Ki
         GKQn835snu2sNu4Q2HTaMbORMX5WsH+ryC3QS6WX9/5r1pVuD5cgwqLx2SoXYENxc3+u
         FxczbBDZrpizNA+krbD/0cNyujciJp/1TJMDkclG0qkXOPLKKCLIxgxgYQvtgiFRtpeL
         TptEPDA7VMMQ5cYsHTLbltTNg/b9WY+Wf8mKDeFgSzlharv8eKUPzmAikFfuIFjumQZT
         vFciMxESXa9zltiJ5wtTkEnzwiG3e6UDUVrjZBVjrm6EFoyfAM4tsjFV/T0EKYySlwhy
         TBnw==
X-Forwarded-Encrypted: i=1; AKwUvBxjCuJslxWLWHZrp8suCNRGZmP22XPs/+V6jfq7/hWb+coYdvgh1G4XEldEKvibZlVlQzN4SPkvxLnCKSufU+7J@lists.infradead.org
X-Gm-Message-State: AFq9FYIE29GRxGFQnDJ/n8lH4Jm3I7si/86LfUMAWz7XWpq71tmJdAEN
	YCmJ9O6n4RPCC1A/DiO1uMqvWN9RfVO7SmCjTL7CgvmmcrBiGz++FB7f
X-Gm-Gg: AYBFou0r0djF5hnAb8PqxTxMyOXpxkFjVZyKcvucEi6TjVhatHpm7ZUEINZONN3slw8
	oPRd9NtqSzm2+lffx2hF5sejjj76E+v3Hj/TE70le22TaYLEjdY7yTrfP+5ksjitTj1DJgsbLeU
	oOtH6hlROr9NfwDM7ZiWI1wGABop/n2K+0MQIcc0cOtwgAlkbDq6gEdgaB2XLa7qMpSfEU6PbG9
	ufqC0FjyHpNHzfn0XbetU3u9qBnkZh++gZoJRWkwKI4RJDw/3JJqGAwoHCyYAzAh8zvbH3ACxYa
	el6fkCt73u99oCnpYw4R04GY0/bBrcqbT7YFC0rwXbvDkzt3TlvKjx8ERZ43A1s2bhg7QeYPGZP
	dhn/tuqUp/Sf0UJhxT+XyXwi0BwhgHEA4lT7fXtPEtxNQ1zbIr8AmESzXSt3IBa4XPOg2Qc6qP9
	occYvOFDp3y9IEWkeSC1igWyYMoJFaaoaJU9IW5nOxfKgCG8ztnRq2+sX1kVA2t2XtaL21LYMPJ
	bBVQIz2do7MJwqu+JSZEdcz9XWjPh41yq5GJQBWsX+XS7CErplHSW0kR/sI894TgJ1NThhmlJP2
	j1ZP6GR0iIuAGinW+kbbbA9unS4AO0EeKEproKUJ1i5H9VX3108/mYS0JQN6
X-Received: by 2002:a05:600c:8114:b0:4a1:dec1:4e1 with SMTP id 5b1f17b1804b1-4a35aca4ab5mr96619105e9.22.1793008665078;
        Mon, 26 Oct 2026 02:57:45 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-92-187.ip49.fastwebnet.it. [93.34.92.187])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4a35a0cc374sm190382825e9.9.2026.10.26.02.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:57:44 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] arm64: dts: airoha: en7581: add crypto node
Date: Mon, 26 Oct 2026 10:57:14 +0100
Message-ID: <20261026095727.31708-9-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261026095727.31708-1-ansuelsmth@gmail.com>
References: <20261026095727.31708-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_025747_253065_388FB2EE 
X-CRM114-Status: GOOD (  10.55  )
X-Spam-Score: -2.1 (--)
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
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add crypto node to support the integrated Inside Secure SafeXcel EIP93.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 arch/arm64/boot/dts/airoha/en7581.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/airoha/en7581.dtsi b/arch/arm64/boot/dts/airoha/en7581.dtsi
index ee1633f01068..f214fa3a3e2b 100644
--- a/arch/arm64/boot/dts/airoha/en7581.dtsi
+++ b/arch/arm64/boot/dts/airoha/en7581.dtsi
@@ -470,6 +470,13 @@ fixed-link {
 			};
 		};
 
+		crypto@1fb70000 {
+			compatible = "airoha,en7581-eip93", "inside-secure,safexcel-eip93ies";
+			reg = <0x0 0x1fb70000 0x0 0x1000>;
+
+			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+		};
+
 		serial@1fbe1000 {
 			compatible = "airoha,an7581-hsuart";
 			reg = <0x0 0x1fbe1000 0x0 0x40>;
-- 
2.55.0


