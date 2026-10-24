Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A167606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 24 Oct 2026 08:40:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e6ZxaQe0;
	dkim=pass (2048-bit key, unprotected) header.d=gahingwoo.com header.i=@gahingwoo.com header.a=rsa-sha256 header.s=fm1 header.b=d2oFM8mz;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=bz7bIU1+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=dk4e+eedEam13wGCRMmw9y+wJRNgv+ioxH1lvC55NVc=; b=e6ZxaQe0Lcglu/5vNzTtdfYbGh
	dWtQjna0vOD4e8SEk2DeFzjlkwhr2ov4brqgFCJjptR0VB6/Es1UeqLhBcV9RQkxDolzy5GA3IRB1
	zExgCF9TRoxNVMGJRNYwMtvA8Ul5pn9tRmLIjdui1VgVeYigE023SnUEhBHemkM6YzpkytJZ4BWsN
	5v/Q+xYUqrr5MPwAJrAfSTMz5Njy8FofPCU9GCA36B0XWo33nAXP9MMRH4xmflXDp6f7zIDbanO/T
	ig/8Mwf9mmzwPJV/ns/aDR3NYdXL+ZFqARKgBifilJ0UlafamEc8FpP8UPye+UUCzMTxljeRxz96C
	Q+dsNvYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKXI9-000000000dq-3zAt;
	Sat, 24 Oct 2026 08:39:53 +0000
Received: from fout-a2-smtp.messagingengine.com ([103.168.172.145])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKXI7-000000000d5-0pOC
	for linux-arm-kernel@lists.infradead.org;
	Sat, 24 Oct 2026 08:39:53 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 88614EC01A4
	for <linux-arm-kernel@lists.infradead.org>; Sat, 24 Oct 2026 04:39:47 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Sat, 24 Oct 2026 04:39:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gahingwoo.com;
	 h=cc:cc:content-transfer-encoding:content-type:date:date:from
	:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to; s=fm1; t=1792831187; x=1792917587; bh=dk4e+eedEa
	m13wGCRMmw9y+wJRNgv+ioxH1lvC55NVc=; b=d2oFM8mzMyYcif1eaPVo2jhsA7
	WOwgW93frOdQJXWbBek6F/HwlA89fPCyZy1+CzKUICrNZUSLZuZCRPdZQt2svot1
	PDRMmceHJa+FVQ+YV7iMWiE6bTWTpZMI5Cd+T1yb3pizlhTxsJwIwCAr40XHEmmm
	D/Qo1xJlsO11fqA56nQ/vhzGCLiXQQ4JK6rKuSQ8YokFsqRiTP0Bc6kz6oj/9YfX
	Qvc+f9dEc3S/0HzSfE7gSkIMTsS/YIFMrkM1oXLaaW+frijSi6nCv1RgeGPinXQk
	wGJlf9JRC/NExOlpstg6J3c6Lw6Vnzyyzsd2WTylb7nQoQrns7o4iJW9DK+A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:date:date:feedback-id:feedback-id:from:from
	:in-reply-to:message-id:mime-version:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1792831187; x=1792917587; bh=dk4e+eedEam13wGCRMmw9y+wJRNgv+ioxH1
	lvC55NVc=; b=bz7bIU1+txNPYxcw6Lf6y2182964hZRmqA3nEkHJ+0HuoLm/sIn
	cXHYP8AIpOf6aFJDkKt6fQThYwLZmvC2bd2KLzkk0tSLt+MF5ev1YYJsIRrzHTID
	OIHqSzw3Np3o72Wwi/hvWRSgNZUfDToPyCry10csGawEK76ZCc4LKLb4rMPtliWN
	b6huJOGrdeIRimkS145EzjldJzRBNnsCB0vUtSlL0buL0j0bsf8Dxp9/sJy6KbAd
	SQoNoLfRuA09s+ce7ZA6l33MYYhHKacqMZHWUIXUhVHfv4lzZoRaG/sHwPQZ/kxT
	jkhUj5oYvXCS6huEfGe68QteHxznF9PJq5A==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=gahingwoo.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792831187; d=gahingwoo.com;
	mf=PGdhaGluZ0BnYWhpbmd3b28uY29tPg==;
	rt=PGxpbnV4LWFybS1rZXJuZWxAbGlzdHMuaW5mcmFkZWFkLm9yZz4=;
	s=fm1:rsa-sha256:qzyBGnI3eQTXOlCcNTUgYIvgP2Y37Sr0dmk0JBcR/tEr4Yd
	+SNICsHj8ZRhHJS4OmINYnlaT0/ss03AoLGqQTOGLpkVF7i0CpMbFWixgXj8UXfL
	5WLNnTaVZam6vse6BD8DS+2m7dgr6J86Uu4AAY1Kh/EtXLkE47U40jObLj72b5m6
	rjd+6t8LlanB4Xtqsg0Rt8ESPRf7uo0WwAiqR6ltZF74ezljW/zj3JzsTPNZ5n6P
	DphGlHsCCH0RPoYN5ZbUmNr/iMjNKcWZ5zRD3dQcSDeF2E0oII25mRaEzzPNNB8q
	fNA0fEBIpejwwLlI1GEHiIu/t1zHglN2Nv81OAg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=9;
	hn=cc,content-transfer-encoding,date,feedback-id,from,
	message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:PnvPF/K/NdvXhLu/i91FAf5qb4UUBnCMoCSJ9dKYvZA=:kWDPm/EXmOFJ312wfG/g9OlfSszOPhrx452WIAG2ZOM=;
X-ME-Sender: <xms:027cao0QKnJgl2TuVdsLf4LzmCpdLG1R6iN8iEPsoW_ug6veKOAz_g>
    <xme:027cavqgj2a9BTYILKyNs47uPoKU9Yz6y2s2yg10W3kN4WcuCZ-IPkg6Cyv_kXlYB
    JSda3XXwht6M3f5UG9oHWKgGwJZwKj-V5idj2DUmittloA7OGlevKGM>
X-ME-Received: <xmr:027calVf5lsVURzsm9eHjFP4bld6tI7ZO2nteb1O_Hu_lnwxL0I4rjnAT2sxqdxsULs0cz5D>
X-ME-Proxy-Cause: dmFkZTEilkQ7QRTV3WCqk13zuvyPjR3rvfRKdMmJjP/0IUkSonux5v7d6YiFkowHCHQQMZ
    UKTuka+etnp0I4pQi4LorcpHTgVejGL0wuRdrC+MGiY+0bYFfrp5Tml1fj2yv6N4JzjygW
    ciLvzb9zDqU9LKMdU/KronOfZfUPAzti/iKqSp/9Ri+tI9S8gQEpchHvM4CzTKNRPKRrLq
    fGuXpHBMMyPZae46Tawr8eZeG80mtkUkkmo9JDsT17WuJINe+UpplGjh9UY0mWBDvAjAfm
    pxNJ1WZSmmsOnyEBqC8Z6C0pfXlBrw+DW0PdJtpX5VPHttAf97aVchdt8+K63vy7glvIkl
    Yg33go8lQiWCw1mp1AzkNjfPFCf61tY8tRIAvu/+iI5dZca04qH/Xyly2C0tFbtD7X5lOn
    0u1hJ2xngjMOqOgLIQ8KTDlltMJPvKmTwk0aAEiqNjIiBs8MvGkm0FLPm0iT/MU4j3vJbu
    iTx/5qwURcN55LtColc3bzrXD3m7oQ6gxkMZJAF+tQ2jNoUbH4TyznDmnnx/stac2kALRJ
    ZQ1HPB25/TBVyS10xcOvGf4c1Do9Ums1oV4VUw4Co+doLnuS+cGF5qqdF5px4D109sqZxH
    aUB2lvdblTY5vbbmXjnGpVK7/oIWB6sk7z4hs2dr8VLUbJNmI5NZ+iVkaNqg
X-ME-Proxy: <xmx:027caor2jeOv-FnZxvtoS_1nX56nfR-TxlOWlrSTlxLCJi7DU_eM5g>
    <xmx:027casDMR76atB6V3gxHlB0PFBCUIeaG77wohXkh2IG4ZInIy-Zajw>
    <xmx:027cakgliaDkw1uvOVvES9ms5Hfo3ervdV15hP7SLtfKA2xDSuWhsg>
    <xmx:027caqb4A_RLixhzDX2E7MCHDs3GGzGJ8NrtjLwMpd6RPr00q8CxfQ>
    <xmx:027caih8zVv4CLHufmo0XMD8YQU22aSF7R41Zo25Bh-l5WligFRn5A6Z>
Feedback-ID: i7a5e4b5f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 24 Oct 2026 04:39:44 -0400 (EDT)
From: Jiaxing Hu <gahing@gahingwoo.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Jiaxing Hu <gahing@gahingwoo.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND] arm64: dts: rockchip: let TCPM own the USB-C VBUS on CM5-IO
Date: Sat, 24 Oct 2026 21:39:42 +1300
Message-ID: <20261024083942.148860-1-gahing@gahingwoo.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_013951_469572_735912A9 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

vcc_5v0_typec0 is the switched VBUS of the USB-C port. It is the
vbus-supply of the FUSB302, but also the phy-supply of u2phy0_otg.
The PHY enables it at boot and keeps it on, so TCPM never sees
vSafe0V and a sink partner stays in SRC_ATTACH_WAIT. A USB-C dock is
not detected.

Drop the phy-supply and leave VBUS to TCPM.

Fixes: 44a48a23974b ("arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO")
Cc: stable@vger.kernel.org
Signed-off-by: Jiaxing Hu <gahing@gahingwoo.com>
---
Resent with the lists on Cc. The first copy went to Heiko only.

 arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
index 5958b391e..72ca49ec3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
@@ -306,7 +306,6 @@ &u2phy0 {
 };
 
 &u2phy0_otg {
-	phy-supply = <&vcc_5v0_typec0>;
 	status = "okay";
 };
 
-- 
2.43.0


