Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66458606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 17:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4darJpIv;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hrHOlwAH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=tY6q0/ZAtlO7c/3kJ3SDz18C60kPr8B6rEIMfU8K4HE=; b=4darJpIvdCsrnW
	5uwkSfI5GDvj4+S8hEY7jjNCP27pxqMBxnmwiGGs4EVhU4kf68F3w3xO1fyGoKn4QXqKfShAxcd7G
	o1hbgF0ToLW4vkERksa6fonXEMqg13DQ8VgwIRvSuxxUPmGnpnHAxq/7UNOH1Nkqa6S+kpQEGvCDA
	0XN0x5ILsbWZKXT1dCZK+I2SjiakzlPdnurjeGsUlZ/zjprdwAWsUh/CfeSvM2uRUJZMs0XBmOTP9
	ImieHkqZtVA1ZYVh4ZdXuQmvxgYRPMn5VNNMb0+VKDIrxbnEe8WUVxQNXw9MINhthvhisqIVJcm0O
	J3Oy7td+Ks3ImwvuETlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTr7-00000009xmm-0iYT;
	Thu, 29 Oct 2026 17:24:01 +0000
Received: from mail-vk1-xa2d.google.com ([2607:f8b0:4864:20::a2d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMTr1-00000009xj3-0EWY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 17:23:56 +0000
Received: by mail-vk1-xa2d.google.com with SMTP id 71dfb90a1353d-5eafb65e204so821511e0c.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 10:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793294633; x=1793899433; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tY6q0/ZAtlO7c/3kJ3SDz18C60kPr8B6rEIMfU8K4HE=;
        b=hrHOlwAHrgRiq6BGU7zNtEe59dF/B0whDR2FKt6Y4LCczvyKrllcgEbnZC0swpGZFW
         IjclOKQgjLMlCK9peZDlxMWRUXyvxdRQ9WiL7piI/Pfgzlmg05TtRW6zDfP1YaLDEvQX
         3G9UuZdkWKgbHoxip3IZ3qYlxc153kx50vQzp8e4KviPafYucQqbZMM79hpqJR26uXVA
         ZhaZPbZwmEKenqxxNU7Fs8ObjxZg9W9+G3S/uMhuvUeLslleLyWlJhKwIkk1v+AY0QFS
         wG1FTnWYDtdjlDgQ6DjGmQJIHjjiHRs32mG4w1dzu87FBuPKGfuVu3+jmcASXQGo0UGA
         trgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793294633; x=1793899433;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tY6q0/ZAtlO7c/3kJ3SDz18C60kPr8B6rEIMfU8K4HE=;
        b=GTlPyXpSLFsfD/9SK4vx8/WVc8t4+5hK+fK1IzygpAFwqCKVwD6jZ2/F1bxaz0KvaG
         P/FDNrvYJPR3eJBt1tKX6ysN/ckGPhID368N8UpuCOgZXx5osZK/MADv81d/3l1R7OL1
         oJi9HiXrfQ+tPAGYnt4P4scFNsD9jxComTtvX+jia0eghtFhyHmDYVEem+e6D49NMxDT
         XoFoVuKzSgvqc+hMZIUZVof23a/pPQcj1XkVFERSoD+TY2AM29YHJccAoOTR78qTE80p
         cmxu6vDexZfXliAjHcMixvypwXqNtD4lxeGRhtvDhuIwKXJ/lvazay2+sL15LOI1VkuK
         m9Gw==
X-Forwarded-Encrypted: i=1; AKwUvByEi5AoDEuA2e4pDecKHBwCPVaZMzVobUjfzERetQvdJok877VrmDorEmcnHA0CF6GibZscyrEKzoxl1bwWMGZp@lists.infradead.org
X-Gm-Message-State: AFq9FYJxkZ0IlrqcENNdjKaE+n2oABCBQebpsKndchM9UBKTeAmt41m7
	EBYeovoBIwhRyuPH4rUztEnnyEkzI7a1uAJtUNhl5moTDYr0RahnL2Y6
X-Gm-Gg: AYBFou0Ho7mDOZOj4JVzvlKnUxgdGIiq4ZF+S1USgv/ciuL7zsaSPTM8bQ9fHfMFgV3
	H0McJgAnLHxcKfNEGzy31P2FupGILd3KqEFbiQu5M8nMaWD1LyALymLS7JENXn/+4zjFHiWYOFf
	XNTt8vupNvYPh1yoT7fgem1FWuAHJi1IWErNvEXcNmEDRUHl5FQ+pLA9BkYWeLUEdCNi900MvsL
	iF0BSJaoQdXMdcRSLP7izcgRM1OBa+sGTEkIqo8nj3bRK1a7DnmzVTQS8Z5Iw2vr/EX86ukR5nS
	TZI4Tt4Jb1I5edEcQ/C9FDWVYY4pp3zN2yjanopm9KxhXi2zuct2p18D69A/usNtqxbdoz1TrT8
	yl+i88WkG7AU5BzoxduKZmX4LXj6zVkkCWh5jlT//zPwF9Og5RS0u7nk6tPNx67cFwpnOeWnQCs
	MiNCBp73Dmsbtz1JNc/DJpBw77/pgroAbdMEo7rbuI+lg+r+wtbalvWxRAbcl4RfqruyJNLaGIf
	iTRcS6zYl4+1LMWJVJ6LEw6k5n5i9aPztz9eNlC+oOJlvhKFWNxrURFH/UtRBoAH/n6COgOEByU
	FZkNQAtW/IJHcYVLH7jUBiKVNAMuzc2iS7NDwA+UmNaEiaCFd5JA+8SKDkLyVUKmA/NcAeYlfaG
	BVmAKp/YeZM3XsieoOxCgTOtwIae9aUuqQCzj
X-Received: by 2002:a05:6102:1626:b0:7cc:2bb7:131d with SMTP id ada2fe7eead31-7d03a4eabe3mr2727809137.9.1793294633099;
        Thu, 29 Oct 2026 10:23:53 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.238.247])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7cea3d32a48sm9907357137.9.2026.10.29.10.23.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 10:23:52 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Xu Rao <raoxu@uniontech.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: phy: document Allwinner A733 USB-2.0 PHY
Date: Thu, 29 Oct 2026 14:23:24 -0300
Message-ID: <20261029172325.3425046-2-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261029172325.3425046-1-vinicius.eduardo.pedrosa@gmail.com>
References: <20261029172325.3425046-1-vinicius.eduardo.pedrosa@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_102355_108186_EEC01A01 
X-CRM114-Status: GOOD (  10.76  )
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

The USB 2.0 PHY in the Allwinner A733 works with the D1 settings of
the sun4i-usb driver. Add its compatible with the D1 fallback, as was
done for the A523.

It gets its own compatible because the driver has to clear SIDDQ
before releasing the PHY reset on this SoC.

Signed-off-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
---
 .../devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
index 580c3296a18d..da4ad6fb3531 100644
--- a/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/allwinner,sun50i-a64-usb-phy.yaml
@@ -23,6 +23,7 @@ properties:
           - enum:
               - allwinner,sun50i-a100-usb-phy
               - allwinner,sun55i-a523-usb-phy
+              - allwinner,sun60i-a733-usb-phy
           - const: allwinner,sun20i-d1-usb-phy
 
   reg:
-- 
2.43.0


