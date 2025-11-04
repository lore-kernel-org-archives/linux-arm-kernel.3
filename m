Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C09E1CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 17:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H/T5BiJZf4ItNx1oEwDxh0qIkoG2N0Jmmg4VQezS5Ik=; b=fC3KNAZUK2jGEENCVHhWDZQjsV
	ODg3PD31G1Hc+SDVt12Ckk4inYl39IDneMUReWRsh0SboT20LioQW3dgg+0v/v1Jk3dnWHFACS/sz
	0tMmcqiS02m9zp/VKsmGLyrvjVANVIKYiM+YTcdNM/fSxJ4JSK3w4aWj4vSVwJT3N77k4t+AO4Dcl
	0Ic5F8U1U5ou4gIGzf8xKW8QNP2iY10I/9SRfWUg9zHpDLPB+4qnx4JIkZll9+OZP6ZPCQcuiNghW
	O+pHUmaDH4Wj3k6+yz+CU9QbVq/a3TFq/599vCPv3h6mdeENsJFQZMsIzqIPUau8GasG/uLOzsT/I
	AR5z+cEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKmu-0000000CGrB-0VFP;
	Tue, 04 Nov 2025 17:25:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGKmr-0000000CGqK-3HwT;
	Tue, 04 Nov 2025 17:25:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1355043D39;
	Tue,  4 Nov 2025 17:25:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2438C4CEF7;
	Tue,  4 Nov 2025 17:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762277139;
	bh=H/T5BiJZf4ItNx1oEwDxh0qIkoG2N0Jmmg4VQezS5Ik=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ULvu/WLPItAYw0dChORCQGUPDmeO+B++jq13dlJWXq0GS1gMXxCo0uPQ5+ZaF+kol
	 ap/l2m+CfQn9ivpMh03sL3L5cOmvRzPIgIvya5H5Ub9bVS4LpHQB+9dtE0TTF9bsh5
	 Hufsx0htjjPw+Hu9HRl0GUIxooSMqugklsA9xxqIPubB7fRFEm0Gi0bi5pMQjWB3bE
	 BvcH5O+pH6IiScT8qdXaKfplDuZE7zDuEJvgD+zYDQq6lERRdqZOZg/gXzXq1DkuJx
	 12sIQXMvjveLH+O1IClakDAutauFVRhXZdd0pxpQCDLNfJXRAkrdThPmcvQGUEqCG+
	 rTSYkZdwdZxYQ==
Date: Tue, 4 Nov 2025 17:25:35 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
	michael.riesch@collabora.com
Subject: Re: [PATCH 2/2] dt-bindings: clock: rk3568: Drop CLK_NR_CLKS define
Message-ID: <20251104-verdict-siding-1400c49da950@spud>
References: <20251103234032.413563-1-heiko@sntech.de>
 <20251103234032.413563-3-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="59LUUKSSW6sp4+oA"
Content-Disposition: inline
In-Reply-To: <20251103234032.413563-3-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_092541_838636_21F3457E 
X-CRM114-Status: UNSURE (   6.70  )
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


--59LUUKSSW6sp4+oA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--59LUUKSSW6sp4+oA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQo3DgAKCRB4tDGHoIJi
0tg9AP9gEnwmbj/eb+41CL+w1IiPVkYa5Gjq4MWTJRllMKI98gEAq+xKR97MKd4e
c//+Nj/S1XhjetsO4KZX9ZwZSsmbPQA=
=nRAO
-----END PGP SIGNATURE-----

--59LUUKSSW6sp4+oA--

