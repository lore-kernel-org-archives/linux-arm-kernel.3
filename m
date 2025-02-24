Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39324C021BC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 17:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PIuf9WUHbdR0oDHD3UfUqjwbtLdy6WEiW9F2eJXTuuU=; b=yviKvfEjBYUDFC/a8vJ60sPdb6
	jjSCtFsycA/32GUhvjHT/uNwuGbD5EczHiYSLlMHTYpePLjAZrgdbIubJ18qifayCgCGlWzi1mIMU
	/d5HkRGbaOMYLp8F1A5aU8RhbOD/Nv8i/mKZYx4dPImbox7trdvWn2dSvu9KGnSeNcr7DtyfzuBtB
	elEv+hU6g+hX41Rts14vCjZkczVoVHqHXBOm4zTU/D+EFcACKoiEaTSxvqRQKZZIsyIDn+9DzRVaw
	pbksYK2qBafDmnlXdm8qokVb2PHN/uoFslHOQFjuSI0ccbeNkdoT3VQ3yW0EIU0vS7yhGZsZZW9c4
	ktkjAtmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmc0p-0000000EZnp-10SX;
	Mon, 24 Feb 2025 17:12:59 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmbya-0000000EZFA-04pj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 17:10:41 +0000
DKIM-Signature: a=rsa-sha256; b=ZzIPgZNULnbX1w+n3o8dprtM/Kqd2iWJd78UtC7LNQShoNXLTD3xjgvrGFlpjD+PQqeXkJxImXBfvoK+J3N5T4RtfDR2yvf3/684PTF9hsLnwLkBAzguysybT3YrOXd+0GYh8uLUkAfIDQUR3ydk7ONrFX/6B22MoWISYAGLDxE72R9RLTG3s3yx52JIpz+kjRDPiC38TpXewHPjsKLuWDY40ikxmHq3J5p2yk0fox3ZFG85UqQJ9cxGtTvMDnhr4108FU+lNmJ7NedXffxzsS2zdr6ReHAnmOU4YRmaQrRbVJp9OsPvw5Y4wi47OesdoZbM6fve6Vv59aVOQa4anA==; s=purelymail1; d=tidylabs.net; v=1; bh=PIuf9WUHbdR0oDHD3UfUqjwbtLdy6WEiW9F2eJXTuuU=; h=Received:From:To:Subject:Date;
DKIM-Signature: a=rsa-sha256; b=L0it4tZoj3QVHfn5Jt37tIzkZQEWjq/CrioyiY3sDq8Na/84DnDEKDQPccyirDWh8yKpWBoo3Tf2/6TLggfNbkb/F8fMAXGUF7i9BOVjcn2j8/U3Vb9BzO7c9pZ2He/iaNoYJ5aAT5VrWR/M0rhY2UMz0aBF1zVYGKuRSKLN5vw/QbUttRM42TFzGCELHAk7UGOOchsNe4qh4+Dcvz4XN4XFt5qgZxfEDhHw7KvftqYS/jXQozUC4AxxPySQrGdzvnU5zrFs+Z1/Xbp2us2Z2iJxgVQqZ+/08gk20LVzuWP6QY08rZZ/TAQPXbg3cSldqWKX1PcvJ/wkGlnaB0pRmQ==; s=purelymail1; d=purelymail.com; v=1; bh=PIuf9WUHbdR0oDHD3UfUqjwbtLdy6WEiW9F2eJXTuuU=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 81901:11097:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1560088192;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Mon, 24 Feb 2025 17:09:59 +0000 (UTC)
From: Justin Klaassen <justin@tidylabs.net>
To: Tianling Shen <cnsztl@gmail.com>,
	Kever Yang <kever.yang@rock-chips.com>,
	Johan Jonker <jbx6244@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Justin Klaassen <justin@tidylabs.net>
Subject: [PATCH] arm64: dts: rockchip: fix u2phy1_host status for NanoPi R4S
Date: Mon, 24 Feb 2025 17:09:24 +0000
Message-ID: <20250224170925.39126-1-justin@tidylabs.net>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_091040_172173_39C35584 
X-CRM114-Status: GOOD (  10.21  )
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

The u2phy1_host should always have the same status as usb_host1_ehci,
otherwise the ehci driver may be initialized for a disabled usb port.

Signed-off-by: Justin Klaassen <justin@tidylabs.net>
---
 arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi b/arch/arm=
64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi
index b1c9bd0e63ef..8d94d9f91a5c 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi
@@ -115,7 +115,7 @@ &u2phy0_host {
 };
=20
 &u2phy1_host {
-=09status =3D "disabled";
+=09phy-supply =3D <&vdd_5v>;
 };
=20
 &uart0 {
--=20
2.47.1


