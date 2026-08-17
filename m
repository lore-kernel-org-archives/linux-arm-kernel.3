Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC795C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 10:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9Qo6H2QZ6oNW5W+5ptlINUYPeeaB2aN4XkzcyXJ8hXU=; b=tKcixRiFMX5bgTnMlurxdQU1L3
	c8B/yaJDKZorhBGT7mIQ16FV/k/O1XJdm6n1tWNletb/79wxAUw/edTmtyw4cOls3jnaJUPa5FlLr
	o0l6iUffuDHVGJAG1h38fiMCAcUQXNrdsimpEfwiMOwUD9lnxBrEABNkKLQNQypxxU7hsoGKUdd1S
	Y42lojLfuo2hHx2WuLoFPG26pTigH5c2g5wqokxh7rq0ffsIkjwKJ/EWw4B5+8eiaAv0ZZ5+cbPNE
	Db93xUcFDUPqSquWS59D/N7LwnsP9JWyYjrLMPtHt+WeomIfdDKla8hlqtqYqeRmd9edXaabYxkuv
	5sCoYLZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuJv-00000005seu-1QnV;
	Mon, 17 Aug 2026 10:11:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvuJu-00000005seQ-0izS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 10:11:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 55670600AE;
	Mon, 17 Aug 2026 10:11:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04A12C2BCB3;
	Mon, 17 Aug 2026 10:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786961513;
	bh=HBymSy0e8V1Jdo3HydqtzVX4WJvfuiz0AeM/kPrBAho=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=X4sqlQuw/USMGTU7Ig1sLJFQfMJqdfQ9bjPa3DsDMrpGvz29zFaUO/jh7UGOLF7r6
	 o+EJxOXXVoXU9sgt61fGxUwxexFVfrSn9QsrxRPtzDj2l2I0ifNOOWLo2Ksh5Dn077
	 P8Lfcq6cBI+3qF4AHD+9dS/XcelSkcIZSPBxA8MVU3q9IPBuwzmLn6JUouvp0eiVve
	 G+OQvueWuOPCLQiCd3PpSeVTbtzOzbZ8pxx8ukJBphgw4vYw0j/Rn6GE+eF/rAXJK3
	 15fCzrKdcyat2wnRC0NE5iRGk99gI+F64Pw5iB0RJYqiPW8CSXCTv6bNc/wuSNlZmk
	 j0AFZnxqXYTrg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D908FC5B572;
	Mon, 17 Aug 2026 10:11:52 +0000 (UTC)
From: Aiden Isik via B4 Relay <devnull+aidenisik.member.fsf.org@kernel.org>
Subject: [PATCH 0/2] Hi there,
Date: Mon, 17 Aug 2026 11:11:44 +0100
Message-Id: <20260817-for-next-lucky7-chipid-v1-0-eb2908705c0d@member.fsf.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGDegmoC/yXMQQ6CMBBG4auQWTsJEK3gVQwLGH5k1BTSFlPTc
 HerLr/Fe4k8nMLTpUjk8FKvi82oDgXJ3NsbWMdsqsvalE114mlxbBEDPzd5vM8ss646MkRwbI0
 0Zmgpx6vDpPE3vnZ/+224Q8L3Rvv+AXE+4tJ6AAAA
X-Change-ID: 20260815-for-next-lucky7-chipid-ecce496c86b9
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Aiden Isik <aidenisik+git@member.fsf.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=760;
 i=aidenisik@member.fsf.org; h=from:subject:message-id;
 bh=HBymSy0e8V1Jdo3HydqtzVX4WJvfuiz0AeM/kPrBAho=;
 b=owEBbQKS/ZANAwAIAUknAbLEetfrAcsmYgBqgt5ikqtrRi9zC5WphlCcPFX8+LqrSpK0WCl/O
 YMXUIuPtquJAjMEAAEIAB0WIQSDy8UkXGpc3JNbEaVJJwGyxHrX6wUCaoLeYgAKCRBJJwGyxHrX
 6/cXEADNUPtRxwYaI87hahphr8JmnU/eihs96reJnyIwHeK4Q81v34q+MMmk3Ztxm29PDT57p0f
 SRqG8QJHZ5k3TOhhA3qTjbN/tvx6W093AAhA9TnvkZ57TdeP4VUlDCdi0Z/nKsg4sG4xdpwkIxe
 agUvqoyzLeBFcuym0EhQe75nRGvyRmVCxW7t0+HP6tZoVC9lbdKN6EOCGmBDYNeIS4au58yqU20
 UEK87Lk0sqWFFtsJmgUx2UFQKwNGu5R7xZaifr+T1k2JfjLOW43/4AP/Mgg6Ex2uaM/oFiRY09x
 tjxNsClfBB/FboFsvAa40jPyXuWZcUPiDPhEPU+ZRlfQIrqMkE8wMguJDaegIRFZjFZnXnHBNC5
 skKlydIu87+QXlTEsr7oHLuvQrjYWaxRtNIZyB1E1n5TJt9EcUZ6NeenUDRTHCSwsspkvwsduyg
 6bRfxNu3bsxynLUSkDYpB6xGorJo2equ16wofTWyB6fn/vYbdT859ou9nLfNoY8M7XdeB/0/6Ya
 kV86yXhrkf2/YnmWCMSL4l3FdjtqKIglXwhwg4Guf8GioKYi8s5TsKe+7UplE8RfBG1R62oqWw9
 a3GePb9GVkkzGSn6Q6Max+Iz8Xfy8Vp0l/QsQdnsrysUFf9PbU8X9cxOAYaGs6aBVzhf8UxH+nV
 gnuNHLUgrBN7H7Q==
X-Developer-Key: i=aidenisik@member.fsf.org; a=openpgp;
 fpr=83CBC5245C6A5CDC935B11A5492701B2C47AD7EB
X-Endpoint-Received: by B4 Relay for aidenisik@member.fsf.org/default with
 auth_id=956
X-Original-From: Aiden Isik <aidenisik@member.fsf.org>
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
Reply-To: aidenisik@member.fsf.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This patchset adds support for the Exynos5515 SoC's chipid to the
chipid driver, and documents the samsung,exynos5515-chipid compatible.

Kind regards,
- Aiden Isik

Signed-off-by: Aiden Isik <aidenisik+git@member.fsf.org>
---
Aiden Isik (2):
      dt-bindings: hwinfo: samsung,exynos-chipid: Add exynos5515 compatible
      soc: samsung: exynos-chipid: Add exynos5515 SoC support

 Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml | 1 +
 drivers/soc/samsung/exynos-chipid.c                                 | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: acde40ba506aae78633e080b5704d33cf4bc13c6
change-id: 20260815-for-next-lucky7-chipid-ecce496c86b9

Best regards,
--  
Aiden Isik <aidenisik@member.fsf.org>



