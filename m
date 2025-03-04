Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0190EC282D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 08:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NeL+tjREbRkAn/ipZR3E2LXil7bCv8lmP1WM9ePrRf0=; b=koLq4sOqdjPfmGlYXZHhYrdE2C
	dxr3NQ0BTvYKwrYOwOOpOYvHU3IReGtWybRnJCoj5FhxBP5dJhNrsL8Yl4YZ+/B34gRXr+YAgxEAQ
	PVSE4LCIQCItqLJTMbauujHAPiapf8QwgPDTyCQ3VSl89E71nJyJ19cKuIWob/NuEN737MSGGSAJv
	4Z5j9RogtvfXS7N6uZgSYc4Zf2J/SztWG6TTlNmDU3BaKU6m2oc14MHjWid9x4BmKILNYC+hBS34N
	hNZxnVM2k+s7Cz1BRceNiUKn7rUeei5XpoaAPHIia+Xiz69+ssJhkCCaGOrRS5YCPGEa1DKhuqaaM
	AhmhoJ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNQp-00000003aPA-01iC;
	Tue, 04 Mar 2025 08:15:15 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNPF-00000003aAy-3Kmc;
	Tue, 04 Mar 2025 08:13:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=NeL+tjREbRkAn/ipZR3E2LXil7bCv8lmP1WM9ePrRf0=; b=eRw47f9YnH7mXuVz6b2FWbvK3d
	4UnbT8pmemglteUnCUGdLQjvg0DcDsffRkumBZyRdP2UVjUVMqyedPniD7WyHBEPbir0Q4K3a3Kcy
	cad9P85gSIswG/CCpkHhVRL2Mhuu3PdAExoBaqQW3WPgeW/5jEh5hNqcwUiuZKueMq6ir50z1jnQ7
	EUzSu+1xhjIFc4OeDD8/LlAeSYpCfIa1UNeWmtpHecI+wjZSHsC4dxCP0yhhpwyHxpMzOF7rmh/T/
	ekdQ79JYMCVGzXE1bImM25eO6wYvt6QP/IbzNATPg0uXGhULWQ6iSd8UzdMcXLNo6tQbgZb3EcE2S
	uUE4a3Bw==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNPC-00000000PwZ-3OZa;
	Tue, 04 Mar 2025 08:13:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 1FF3AA4530B;
	Tue,  4 Mar 2025 08:07:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CC73C4CEE5;
	Tue,  4 Mar 2025 08:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741076003;
	bh=GHy5E/3mPv773kIwD9J1pCgLnjD33qEGYhJtCdEIpPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P7XLZFu5KdnMZWgJ4CPWxZm/klB4jrV+EVKtDi70MwYPiycz2O6teOvZstbbB5uKn
	 4HwoUxIxuHHnuCypMFixeYlVN5fDlopFAfbhSRyw/rsIDOvcnARxv3U89fQHCLT1rT
	 YH+0V+isLot4BXjTul7TmgUBvCuRmJW/mLMIc6bNu/Gy11mEgx/W4ucWePaZT1wAtB
	 5UhwuaBMPU1q2xQ4PqU2BBOzTKgpz0LFcHjnjV3cktNatF7Rw/Adbd1BdbARmK/Q81
	 EsrI3k9YzFvgdiu9I57NpQbQWc3S7kvI4IhjCmipKXE+OF5Qji9blkKlCrkHH2vf3s
	 +TcVyR1GsGUGw==
Date: Tue, 4 Mar 2025 09:13:20 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
	Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel@collabora.com, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 03/12] phy: rockchip: samsung-hdptx: Fix clock ratio
 setup
Message-ID: <20250304-small-mindful-mongrel-bd6f8b@houat>
References: <20250304-phy-sam-hdptx-bpc-v4-0-8657847c13f7@collabora.com>
 <20250304-phy-sam-hdptx-bpc-v4-3-8657847c13f7@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="sg64fqm2xqk74cdt"
Content-Disposition: inline
In-Reply-To: <20250304-phy-sam-hdptx-bpc-v4-3-8657847c13f7@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_081335_095495_D0421D58 
X-CRM114-Status: GOOD (  14.76  )
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


--sg64fqm2xqk74cdt
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 03/12] phy: rockchip: samsung-hdptx: Fix clock ratio
 setup
MIME-Version: 1.0

Hi,

On Tue, Mar 04, 2025 at 03:44:02AM +0200, Cristian Ciocaltea wrote:
> The switch from 1/10 to 1/40 clock ratio must happen when exceeding the
> 340 MHz rate limit of HDMI 1.4, i.e. when entering the HDMI 2.0 domain,
> and not before.
>=20
> While at it, introduce a define for this rate limit constant.
>=20
> Fixes: 553be2830c5f ("phy: rockchip: Add Samsung HDMI/eDP Combo PHY drive=
r")
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/=
phy/rockchip/phy-rockchip-samsung-hdptx.c
> index f88369864c50e4563834ccbb26f1f9f440e99271..cf2c3a46604cb9d8c26fe5ec8=
346904e0b62848f 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
> @@ -320,6 +320,7 @@
>  #define LN3_TX_SER_RATE_SEL_HBR2_MASK	BIT(3)
>  #define LN3_TX_SER_RATE_SEL_HBR3_MASK	BIT(2)
> =20
> +#define HDMI14_MAX_RATE			340000000
>  #define HDMI20_MAX_RATE			600000000
> =20
>  enum dp_link_rate {
> @@ -1072,7 +1073,7 @@ static int rk_hdptx_ropll_tmds_mode_config(struct r=
k_hdptx_phy *hdptx,
> =20
>  	regmap_write(hdptx->regmap, LNTOP_REG(0200), 0x06);
> =20
> -	if (rate >=3D 3400000) {
> +	if (rate > HDMI14_MAX_RATE / 100) {

The rate seems to come from rk_hdptx_phy_power_on and eventually from
tmds_char_rate in the PHY config options, so its rate is in Hertz.
HDMI14_MAX_RATE and HDMI20_MAX_RATE are both defined in Hertz as well.
It seems super odd to mee that you then convert HDMI14_MAX_RATE to hHz?

Maxime

--sg64fqm2xqk74cdt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ8a2IAAKCRAnX84Zoj2+
dhWwAXsGrPqoPNFcfL6UhsGPHfIbxb05Q1NH5HI480bGuviWiVrea7qwGAeT8u2M
KeEzcAsBfj2fxEy07AOeK8CNxPHb+7WdQQNZaTTvJ0v33gEjKuOtX/vTQGE2pL5b
8uPw/l2Bkg==
=cCWQ
-----END PGP SIGNATURE-----

--sg64fqm2xqk74cdt--

