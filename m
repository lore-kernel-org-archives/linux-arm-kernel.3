Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763CE606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 25 Oct 2026 14:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ihh+RHYm;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Z8zcrmFT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=qZDW2dez0cOfo2mICduaoV5mJqQ/i8sEV5FUxUvLkpU=; b=Ihh+RHYmgy9y3N
	ZPJuJ78rag2N4BsqyxqfjHfMJ4dNc/891VAeKGXr5tRmhOKV4TzIA6w+R5jAaW01pwNhjCIt2ZgOa
	djFL/MasLO7v0FgRxibYfZH+AlP9HrNh1gvb+2fC/bC5A3fclIJxKx7Yk78GpvV0OrchPnUic9lHO
	oRuX47qSE1WhxFiNMAK8Nm0wALyXviciygw37wdgxlJutwVp75SVXZS8H0Hqx+IUBIghUF+zy14IH
	H6PaNlo6mvhNFj2wdOkJQZ2Kn8wEmmrC243d7QRIjqHtFfaiwn6YifzZJ/F/Le0x01qooyvu6Yjox
	i+9Fz7lU9swrnIx8pPcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKz9H-00000001730-3NDn;
	Sun, 25 Oct 2026 14:24:35 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKz9E-00000001722-27th
	for linux-arm-kernel@lists.infradead.org;
	Sun, 25 Oct 2026 14:24:33 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so2554395e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 25 Oct 2026 07:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792938270; x=1793543070; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qZDW2dez0cOfo2mICduaoV5mJqQ/i8sEV5FUxUvLkpU=;
        b=Z8zcrmFTM0EHp0R8WSE0owGEGQi2ypXmDmfufGXOdoenu73trYHGmJxenotkTFvBxK
         IpCkFkq5gnKbwviXM5wnCoooumjLEXKF8QpvJ9Y6Iw9u0+WZWrgqETPgY/igTMz4sfji
         rui0FXiCxZuhuYmIi1yOzkg0uBEJWXqCMOh11qOo9lIU+SWFEgT1hCmlVx1u6fknKbrd
         5TKvL+xAoQ5Rd6TdKr05mYjn2de+2WtkKoxXy1mmKmdpcLdEhE4Apd+8SKrfTrTzP4zp
         8836U7xPUKBVHZxVXEvpAvJxE7T20m6slJ/55Ch+v3NUWKqeQuT4OYUl7jK0410pvUJD
         cifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792938270; x=1793543070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qZDW2dez0cOfo2mICduaoV5mJqQ/i8sEV5FUxUvLkpU=;
        b=IGxbqgjrNfdTP3ZfLoioTXtxDWjtKve/eTbzBDJEyTZKZgWe/cruD9l0BgkXs2riKo
         joRIcvM22PjGo5D3bC+fBwIPRI885Q+emUR1fgC4NnXrsCUh+M0974yvanhknXZ3aEy/
         IxPIdhKXEIwwVNss2zVD+NpYHiVUVaumGkbayoJlXpipIZjaoMRgREFtsZh+2ev1Y/ix
         +nsuvc6hsLmp54oQXIyC+31k2MyEvUQGx7KBRy4GI1+E3914eEH834ttDzQBy77aJfZM
         +ruCbHUE5vHEJEa4M97EF4eZC+5mSsbPw1sz6puk6RqXqaJT2dTqaul1Va4psZvMbGJO
         /UFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUL+wx0EO64qzihJfibG6K9UV/N1OpqGuWsQjYScGsOrcFTMOhK2AYrSiYunnHY4RpDVk2TGaBVXh08i6SttAM@lists.infradead.org
X-Gm-Message-State: AFq9FYLjmBWqCxO/xJvGEd5/O04YU7i5mAn8vPSqm4na7oVYgLS1nvwl
	aR6+TD7kV6TBw71gn8pMfX1pUNTzeIdiw58q8B5pLUiLl5lPhszB3iAx
X-Gm-Gg: AYBFou0qCVXNQrA/9nBVKSbg+faqft0xmtYd9Dyd4ww2hrQrRl3mDQjSwAw/PiFd3uI
	X151e/JXW4DUUozA1ImFXdiz0zshf6Y5mEm1lIFozcQq4UDcn6lSrxis6z6FHWEXazLQUOnrTNQ
	LoKcjX7WUP52ffYX7CpvCpKrg2jeMBOy5oikDfvCYRcmwscmXGKk3zxH7NQ1qVbRPW87J2oPcMG
	miqlcu+QgM4TNHtXwS0NFXSBHMEaXZqbM9JgzqVD+giF8y5YC7conyg8FLOS3ge1AjsiU3IVDtO
	kqkF102KC0RuMlZl6dNNHpKtsOOJMVTzugjVAl3YJwt+4bd1s3a1EtJdbqct+KsLyvEKrdmS2uA
	YXJ5y4B0QjPkg+n/1g3uQGjuihNB/fxb5RhT+RfwzJDCfW7H2axVRABH8M5jg3ycFQqK1oWtBaw
	ypIrjTq+9yJF0aDoNUtEizu6ITsvuEUeJIrSkmbGMY5hRJW67HRV0zL7/iuBMuU2IqZTKFlpkkc
	MiGRIBsdXz68ICgLBg8M1l+SWb+pl+t/xMt8nvTdLSB+wJ8TAB2HVgd+O3jHq69IEB0lJojPzfm
	ENDnO57HdIRkTQ==
X-Received: by 2002:a05:600c:3491:b0:4a2:40:8d2c with SMTP id 5b1f17b1804b1-4a35acbd31amr73775825e9.26.1792938270408;
        Sun, 25 Oct 2026 07:24:30 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a0aa0bcsm157074265e9.4.2026.10.25.07.24.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 07:24:29 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v3 3/3] arm64: dts: allwinner: a523: drop the PA GPIO interrupt
Date: Sun, 25 Oct 2026 14:24:12 +0000
Message-ID: <20261025142412.112216-4-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261025142412.112216-1-pmazzini@gmail.com>
References: <20261025142412.112216-1-pmazzini@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261025_072432_555101_98D61A92 
X-CRM114-Status: GOOD (  10.99  )
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
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The PA IRQ bank is not implemented, and the driver now numbers the IRQ
banks from PB. Drop its interrupt.

This reverts commit 6b81aa0c8a4f ("arm64: dts: allwinner: a523: Add
missing GPIO interrupt").

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
index 85ef492ffeae..fc4d714a96ea 100644
--- a/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
+++ b/arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
@@ -129,8 +129,7 @@ gpu: gpu@1800000 {
 		pio: pinctrl@2000000 {
 			compatible = "allwinner,sun55i-a523-pinctrl";
 			reg = <0x2000000 0x800>;
-			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>,
-- 
2.52.0


