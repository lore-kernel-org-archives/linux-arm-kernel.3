Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D932606A900
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 16:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u+JN7thJ;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PS2qsXlu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=yC83ESjOXOvwycANDHqMUIA/nyL5tEqJwdOrO5/UNYc=; b=u+JN7thJ8v6EVHvbwYeptaI5/k
	/NL7I0ZPx2DDuWfSEyoKlRjnFKf7Kg95F6PCl6tIveC9tB6yGJTxk9Q2Smo452kbs8GB51bRYmiwo
	BdCl11wzGGAB/da+5tGHkb0A5DTqogUPVKx9jofnNEh+eHqmkQqjT/mGYnvT1X/Oqxn+o9FhLQmyO
	HQGeshISyH1Z5S+drSggRFULahRIoYLYxdgSCJgKS073pl2Ovn00Btew1mbU6noFpCuSpFrjozJT2
	WktxDr45VqdpJPeZU9cje6fBtKqSPUPK9q0FOdQSeiIpb9u18ReTJP1WhrwAFn4/yfP7TWvmGbno/
	2WycYBhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0Zs-00000009gZL-3gF7;
	Thu, 05 Nov 2026 16:44:40 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0Zn-00000009gY7-1tJX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 16:44:39 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c434376dbebso203425066b.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 08:44:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793897072; x=1794501872; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yC83ESjOXOvwycANDHqMUIA/nyL5tEqJwdOrO5/UNYc=;
        b=PS2qsXluzTBSjI0YkvumFT46Paivw47RtwRokGy0hHNuZrxge8cxbYg9QIlQBrDbBp
         FNVDcTf34vASXvGP9/XDRB4nMY1kZ/hPotZiDIHnpzJha5RbOv+CQT4c4hfEiflEYSh7
         snVhQEV3JFko+GlkTBVNKoBFL1XITENf2zZ6MbceBbqQe3u5tga7eavXfayu1qHFvgmw
         m0QTbQhW5k5upbZAnPpV9CX4e7Tf8u6cAJQPOFBNYEIDkm6JxGaVk+P+WW9l0+bJE5Ou
         yVO0Q8RUUHk/hMJO/tkI6QMLApLOWQGLbg3uM812hOnBf0TVc2lC3+23+jBsccoS+YV2
         eMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793897072; x=1794501872;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=yC83ESjOXOvwycANDHqMUIA/nyL5tEqJwdOrO5/UNYc=;
        b=1e7fjEtyIwPJ6bPlVtTM6OAgec8TOZ7lxI4qXoAu3/P8PMmJd9Th5UgREzjXX6IFhy
         hfN/X71OZYEi8KtNCuROiUjfr0tHBiQoSEcVemj9WICVfnphwFK0bE052eM8CX3QkSao
         vu3pX7/SZ7PXIipM8rnURHBqM9iZSJArbBbgh2IacGMrw/Iz2J9F9P+AVdk26lGw99lF
         4iboBICY7X5xttD3ioSlr7CKkfc7ueLDdlOjwEPYeCGWFj+Tn7H5UGynrkVuH0xRJXjJ
         blCAS2xwoS9YP8VFgLFFR6wJbwuduYgRDtOEoUI3k3QCIGkvw+8ESnoWBUAT+fTrk4RV
         RXGg==
X-Forwarded-Encrypted: i=1; AKwUvBzz7GyKZGP36g0jKWO+55HzfFdycnm6CE8WYpaFh8kTgBpY+K2bagkprHl0EedjdyIBn6pYOWspMk7Q28F3B4C1@lists.infradead.org
X-Gm-Message-State: APuU4Z9Yj7CbAHO2NZ2bn4OQuWTdKUhx/ySZ2U5AeSfdRrFeyMleQo+W
	f46OaKOt5PtnJzp9t1LpSRvBpi52Jp/FM+ZHxp3X3o/F19n6HkWR4aGzHB+nsdwLQHle4KbKRng
	qNoRo61M=
X-Gm-Gg: AYBFou3b4ehwqvMz4xh2lIwwa97ia1cxAghsf1IkkMQM3H6ZC8vTFGn0Ta14LvuBtPq
	KK3ksMvWRAL1h6xIDF2xTTFAVUucjCwSL86M9/wN117K4Gtoc9jZKz4BHD5pJrkJyjND4TIdbT+
	x1cIV62hsF3hdH3s9ttL6ZyEfo90oYnXCHtOMltXyweUnv1hSnMVxqduiViC6Eyx1MJmcvNFkOQ
	JX+q6oL4SlubwDvpTmKgVtmQbjQGqh5t+MD+RaO13kCL3b4aRlSr3DQmaHzguyG28qQ6bOw/0eH
	JFQg/gE7xjZkdcxOny1vOC4kXXo56mA/WJ9o3bqcDy4YGh+A1lSw94FDaMwja2iuESKcaQGxH6f
	EMwzpeYcxl050fxW66x3BNTPh0da0Cuu1rCANkmL0vI28IqYVbuKOmSNxxj14LtciC77Xwr3S6e
	o5ToZQJvE9WYvWTqU0t4LKAM3qYixMAyuL5cYJjvhYGzGMiXzYctnm078kjZQg8btG5eY+z2u7V
	YBTvTKuN4BPQXWU9HtF+LZkf1CNdsH4JwQG7oIYJx9be9+hN+Af0G2sAiw6rBM+RV6cMQccClec
	O0AkIClS5b+scqXivxLNrC9Hj9pG++CyxvAxSn98fW0Kd5WBrAFePcflBahK7hO8hcgdtAmpmTX
	uGzUJQU9Z3MCv5zBslk/w
X-Received: by 2002:a17:907:86a3:b0:c46:9745:ac13 with SMTP id a640c23a62f3a-c4d207ef40cmr272696766b.32.1793897071769;
        Thu, 05 Nov 2026 08:44:31 -0800 (PST)
Received: from puffmais2.c.googlers.com (180.192.141.34.bc.googleusercontent.com. [34.141.192.180])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e48d0dcsm186593666b.70.2026.11.05.08.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:44:31 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Nov 2026 16:44:29 +0000
Subject: [PATCH] Revert "arm64: dts: exynos: gs101-oriole: add pd-disable
 and typec-power-opmode"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261105-gs101-tcpci-bootloader-dt-v1-1-4b7e373778f2@linaro.org>
X-B4-Tracking: v=1; b=H4sIAG2y7GoC/x2MywqAIBAAfyX23IIuRY9fiQ6mWy1EhkoE0r8nz
 W0OMxkiB+EIY5Uh8C1R/FlE1xXY3Zwbo7jiQIpaXcAtaqUx2csKLt6nwxvHAV1C6hpue9PTQAp
 KfwVe5fnf0/y+H+0rQNNrAAAA
X-Change-ID: 20251111-gs101-tcpci-bootloader-dt-274e58a82920
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Juan Yescas <jyescas@google.com>, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, kernel-team@android.com, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_084436_662831_8756E048 
X-CRM114-Status: GOOD (  11.88  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This reverts commit 817473b6ddaf9eb5f2bc7d6dce9fa13a921477a0.

The Pixel 6 / 6 Pro bootloader version 17.0-15681480, part of the
Android 17.0.0 release, knows about the upstream DT and disables power
delivery itself when the serial console is enabled. The workaround is
therefore not needed anymore and can be reverted, as anticipated in the
commit message of the above commit.

Since then, the node has moved to gs101-pixel-common.dtsi, so this now
applies to both Pixel 6 (oriole) and Pixel 6 Pro (raven).

With older bootloaders, enabling the serial console will again result
in endless TCPCI interrupts.

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
 arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
index e5736c39d1e0..dc908dd7e1c6 100644
--- a/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
+++ b/arch/arm64/boot/dts/exynos/google/gs101-pixel-common.dtsi
@@ -662,6 +662,7 @@ connector {
 			self-powered;
 			try-power-role = "sink";
 			op-sink-microwatt = <2600000>;
+			new-source-frs-typec-current = <FRS_5V_1P5A>;
 			slow-charger-loop;
 			pd-revision = /bits/ 8 <0x03 0x01 0x01 0x08>;
 			cc-debounce-time-ms = <170>;
@@ -704,12 +705,6 @@ VDO_DFP(DFP_VDO_VER1_1,
 						0, 0, 0x18d1)
 					VDO_CERT(0x0)
 					VDO_PRODUCT(0x4ee1, 0x0)>;
-			/*
-			 * Until bootloader is updated to set those two when
-			 * console is enabled, we disable PD here.
-			 */
-			pd-disable;
-			typec-power-opmode = "default";
 
 			ports {
 				#address-cells = <1>;

---
base-commit: 2637bdec0535a2044cd830eba9a79363651d9043
change-id: 20251111-gs101-tcpci-bootloader-dt-274e58a82920

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>


