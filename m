Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2EBCC44511
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 06:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Mime-Version:In-Reply-To:References:From:Subject:Message-Id:Cc:Date:To:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jTAATjYPhuU81OuGKaNMSYMV3823/3WCISpb5ZX8+PY=; b=Yb7AuJq/NelLpHN7uX0hqvC+qi
	gKHL91VmT2q0YmBzKMd86CyCJAmFfDbFWEPEg+ZkoWTr856/TQLqUfj9Z9vJT2UyQ2DKJ4SDnFf8k
	cB1ZRIDqUqhjjp8Bc0Fz3vtKjamFW9SKhVCHmtWVIeafDBzRHsfvUFOIAz0i693DZ8V9+Jy4eSaVZ
	AgLn+2e/O3uJgfxMT1NDHbsEVMlLrW0BcTaYhB4zAFTkkYK7XlGo7qwYIC37lqX6HZP/se98s7Mo2
	Dd5sp5j5FutDiGhFQWyhHwZt9ajLEOVtdoSSaeJjaLY8Jv9ScwRi/d9tmjAAh5REyJBySzHHs8SlT
	yx9ChwzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkG0p-0000000GaWo-0C9s;
	Thu, 16 Jul 2026 06:56:03 +0000
Received: from gy.d.sender-sib.com ([77.32.148.25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkG0j-0000000GaP2-1cnv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 06:55:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
 q=dns/txt; s=brevo2; bh=jTAATjYPhuU81OuGKaNMSYMV3823/3WCISpb5ZX8+PY=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:in-reply-to:references:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=FoivzM/j74SelzQm7upvXcE19gr4w6gW8Lb0bWEkvsgUNwCagNKse/OpQk+ZuEVIK3qS5b+7/4Y4
        SnZaiqqZAJgC1JYiwlkyuUZYe9c7hMFkGCnWbqRnEzGqY/23M2NazKu9LuGYHc4j5VIciCXcUZx2
        b/6/+1lpIuKmwGsbJ9u7n6cQftJHU5NBswbkDvAjAnHlMxDMMk7fpgu0CwQ8gkDntv6JOhOWpJrC
        /vAIGk1mh3BAapuREYf/SQLbwxYcJrOwcFW3TLgGPw6l8O52ZacPKsCXJ6M73MayUuTQtEJUVQBc
        u78uRFn/AYbovXsA7XNmr8M+d/9ZqS80i3zpcg==
X-Mailin-EID: NDg1NjE3NDAyfmxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZ348MjAyNjA3MTYwNjU1NDguMjQ2NjE5OC0yLWdhaGluZ0BnYWhpbmd3b28uY29tPn5neS5kLnNlbmRlci1zaWIuY29t
To: <heiko@sntech.de>,<robh@kernel.org>,<krzk+dt@kernel.org>,<conor+dt@kernel.org>
Date: Thu, 16 Jul 2026 18:55:47 +1200
X-sib-id: ZaC-SEA-3oQUMKB7FSKu0ldN1kl_AU7xqYrz76qtQpF5ioKP7bfwVqZ-sJw_6Rv3IoFKvqG8GHn3EhfIJtsi-a0zOrPy7QI8hoptrzc3FCkD-TTBNShmocgMT9BR-JHMPXWKM1oS91Pn_h6OSVrD7NDZJAEuXg3_PhoTpLaZpTNug4VdoJ1hXhTGwu1IvyK8loMg
Cc: <devicetree@vger.kernel.org>,  <linux-rockchip@lists.infradead.org>,  <linux-arm-kernel@lists.infradead.org>,  <linux-kernel@vger.kernel.org>
Message-Id: <22c98de3-0a6a-4927-b865-f4a5451f7c6f@smtp-relay.sendinblue.com>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
X-CSA-Complaints: csa-complaints@eco.de
Subject: [PATCH v2 1/2] dt-bindings: arm: rockchip: Add ArmSoM CM5 and CM5-IO
Origin-messageId: <20260716065548.2466198-2-gahing@gahingwoo.com>
Feedback-ID: 77.32.148.25:11677070_-1:11677070:Sendinblue
From: "Jiaxing Hu" <gahing@gahingwoo.com>
References: <20260716065548.2466198-1-gahing@gahingwoo.com>
In-Reply-To: <20260716065548.2466198-1-gahing@gahingwoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: git-send-email 2.43.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_235557_721939_8C874883 
X-CRM114-Status: UNSURE (   5.41  )
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


Add compatibles for the ArmSoM CM5, an RK3576 compute module, and its
CM5-IO carrier board.

Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
 Documentation/devicetree/bindings/arm/rockchip.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/rockchip.yaml b/Document=
ation/devicetree/bindings/arm/rockchip.yaml
index 1a9dde186..5c7697f4d 100644
--- a/Documentation/devicetree/bindings/arm/rockchip.yaml
+++ b/Documentation/devicetree/bindings/arm/rockchip.yaml
@@ -71,6 +71,13 @@ properties:
           - const: ariaboard,photonicat
           - const: rockchip,rk3568
=20
+      - description: ArmSoM CM5 Module based boards
+        items:
+          - enum:
+              - armsom,cm5-io
+          - const: armsom,cm5
+          - const: rockchip,rk3576
+
       - description: ArmSoM Sige1 board
         items:
           - const: armsom,sige1
--=20
2.43.0




