Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C8FBE77183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 21:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sJGC5U6NyEZfHZAbEKwFZDzPBWxvDuzsYdPOHW5lSGU=; b=wBxQfrh/OrhVaMVyBAql9Jwbho
	hQMf9Uv0ZfQfD2BIl9U6hwgXjiNz/uUSiL/t/ro0MdjmvrDV99GKhMrze3JvkLyh1f8XEju3KUo3z
	IPcMp/jW9hzUwJjtexhpOJwHu90Gxr3h/Vi9PexlYoowqFXvVvkO44DHZ4CKWCaA99Z5UYN7nHj9H
	fJXiNo4XOybTXR156xXlkyLwycy5hZj48M7xKjGn0SInW6IyRtorj/55o5trMw8V3C7Whf39KOfKu
	1oBju1LBX/tZK2HR37Ih8Lgh85VZJlwuhjRqk3w9GTWnNWfok4V7AzJ7+T55cRgdjmJj7UaaIEaUq
	cpkU+Xkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNItr-0000000BT09-1uha;
	Mon, 16 Dec 2024 21:45:11 +0000
Received: from mail-io1-xd2a.google.com ([2607:f8b0:4864:20::d2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNIrn-0000000BSad-0Ua7;
	Mon, 16 Dec 2024 21:43:04 +0000
Received: by mail-io1-xd2a.google.com with SMTP id ca18e2360f4ac-844e7bc6d84so113039139f.0;
        Mon, 16 Dec 2024 13:43:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734385382; x=1734990182; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sJGC5U6NyEZfHZAbEKwFZDzPBWxvDuzsYdPOHW5lSGU=;
        b=IvFJ6Sibr7U1QEOEVMFLrdoAAHall691RFT1Dr4ww3UVXXrUmclrc/31smBlSftr+R
         gXDpNxkMUE6gZItmmJN0ba6GY7McTdL4Z0qI3bzEOHg3WsTP0IiUMjiJs/tdAh1ZmfdX
         w+yV6UDLt/15p5joric5aWKif6fw4byjM6p94Z1LI3m0FOcz6B44Bs8dazlJyJuKYJuO
         qYiJhlxU5mNw9Z7Wu//zOM1/pjOTC+FWzCJmqURUBEfNv2dh9uRDkBkMDPlMo7KtpMZa
         PMdcpUkrSpY1X26I5+TX2/G1sLucWg4MIeV0lphZcnsxUnyOQqKUY+138G93KiDyJA2F
         HbEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734385382; x=1734990182;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJGC5U6NyEZfHZAbEKwFZDzPBWxvDuzsYdPOHW5lSGU=;
        b=pzSEzJgHHr/ZcA6NLaGiClosj7y/n/6xh1vAimkC1N+DBNgTTSVhSOyWRYVuQh+moj
         +Kbj6zeX8BvarJXjjpbgh47WyTuir+u8CpzAybNaXiqtLbkMXvCKY7vevfC1FTP+P1cO
         wc5KgxnQNZjXWFA88Q2FGyP632DqAruhvEMfTBkKz/zz5+wvUHo0rgQOX340XRlVi9KA
         +RUYZqnw7nQF8TyAttuO/ij1jhB+tes7PWH7NrbNpOZKJa5CIRRbemJL8jrFolsPQ1zD
         8vm6VONVuJzVoz24DhfSL/qSQd1Kq1W+fYQEOeFwxoZUlljxi3svtx3td8aosQlvrPCZ
         byHw==
X-Forwarded-Encrypted: i=1; AJvYcCV/86O+PmjK2PYhQkCQsZggbSv9Jx/K4z2RvQFTGSwV29mOFc8QtLLx9Q0X9aLabGHyOVRMRtGnJxfz/lRj0cc=@lists.infradead.org, AJvYcCX4YlnVLJxQ08Idd1W5ED2PrjsPejIzonnYwe5pOorpDZkblrDw7BjI92XPghJ6lC1v/zRmvaOttgf2DsTESOAN@lists.infradead.org
X-Gm-Message-State: AOJu0Ywsq3G/WiOvybZ7fALF4ES52fDIyjGKe70Z4+5eeRjbitKHU/MG
	XuiRictkenSjJ4bvLBo6v+kPZUJNt9J5NXMUn295LPB+VIOWWv7f
X-Gm-Gg: ASbGnctlkwvNtvMEYxjPxhGQtY9XMUSGSe+B4rX7s9V+l6lx1HgyDmh9NMPfS0djIHQ
	BTZ2d6x833DhwPoi+dIRkaQsyV/hz4XVAmH6AgNKZK3loyP2rIOaPeoI6zGGGEOaMbhy2v+q1XY
	BO4ZZ7xxNP9UfiYbKapVMd0bW6SpFc06lSDamvurkEu+ZnAeBUc9rN05G5oSvae/VBRA7zThC9w
	txas8oq0ieawsIZrLVJzpEXW+qdy4VUfW4oIrCmY/5Xa9hvhPMh6BT0ERoQHQdZhwvKEUZOcibQ
	i0rA2CarM6gjNP6gnhJrrNZPJUY=
X-Google-Smtp-Source: AGHT+IGGL+T7hHbT0CUdKvIQYbiW0JKuL6n1e24a8GhUs3rIydemyYi24k0v3/J7YQcbUHUUNpcXrg==
X-Received: by 2002:a05:6602:148e:b0:835:3dfc:5ba5 with SMTP id ca18e2360f4ac-84747e25760mr101114239f.5.1734385382055;
        Mon, 16 Dec 2024 13:43:02 -0800 (PST)
Received: from localhost.localdomain (65-128-205-244.mpls.qwest.net. [65.128.205.244])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e5e32a342asm1426777173.89.2024.12.16.13.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 13:43:01 -0800 (PST)
From: Shimrra Shai <shimrrashai@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	heiko@sntech.de,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	robh@kernel.org,
	Shimrra Shai <shimrrashai@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: rockchip: Add Firefly ITX-3588J board
Date: Mon, 16 Dec 2024 15:41:51 -0600
Message-ID: <20241216214152.58387-2-shimrrashai@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241216214152.58387-1-shimrrashai@gmail.com>
References: <20241216214152.58387-1-shimrrashai@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_134303_151764_DEC8CD55 
X-CRM114-Status: UNSURE (   7.65  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Document board compatible bindings.

Signed-off-by: Shimrra Shai <shimrrashai@gmail.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Documentation/devicetree/bindings/arm/rockchip.yaml
index 753199a12..fc7ee86e2 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -167,6 +167,13 @@ properties:
           - const: engicam,px30-core
           - const: rockchip,px30
 
+      - description: Firefly Core-3588J-based boards
+        items:
+          - enum:
+              - firefly,itx-3588j
+          - const: firefly,core-3588j
+          - const: rockchip,rk3588
+
       - description: Firefly Core-PX30-JD4 on MB-JD4-PX30 baseboard
         items:
           - const: firefly,px30-jd4-core-mb
-- 
2.45.2


