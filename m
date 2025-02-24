Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A150C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 09:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=coQpN1nKHgGKkMTUN+sI75uFyqPjk4mGdjVG4PGQWys=; b=Kf8k5Y52RbYJCWfXIwDUF/Fb8h
	ppUvz6/PyROFevsxjXwn+2r31awbZgTLGoz8eRWgDbPE23E+jg+rw+5oXYPQ5ymkMwCE3DzYvlXE2
	zbubXVUN63oMahuNUeAjeN1TGTRdBjBSJlsiEMa7eEBat2JzJZjoSDQ6vhgWIFAyo7MIcApLDteuh
	P/B3/XYuXT5SC/JD/xZkINOKZg1lp6klOp2/xnNIcli3oOiDqawb+HOYj0KSKpVGo+iQ+HTP3l2/8
	3cpBOMqmJ8WPZA8pYUwfYt93vIvZScJq0mCRFp8oyACCUuc5bSSjyh0j97Cy0StClfvffolut9wjL
	BhIND2Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUZs-0000000CrnV-3fhc;
	Mon, 24 Feb 2025 09:16:40 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmUEs-0000000CmQn-3GKI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 08:55:00 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tmUEV-00031V-Cf; Mon, 24 Feb 2025 09:54:35 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tmUES-002Yzx-16;
	Mon, 24 Feb 2025 09:54:32 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tmUEN-000201-0o;
	Mon, 24 Feb 2025 09:54:27 +0100
Message-ID: <ee0f5b583aadb42e7557e1afc49c5b9af594d2c3.camel@pengutronix.de>
Subject: Re: [PATCH v16 2/3] i2c: aspeed: support AST2600 i2c new register
 mode driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Ryan Chen <ryan_chen@aspeedtech.com>, benh@kernel.crashing.org, 
 joel@jms.id.au, andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
  conor+dt@kernel.org, andrew@codeconstruct.com.au, 
 andriy.shevchenko@linux.intel.com, linux-i2c@vger.kernel.org, 
 openbmc@lists.ozlabs.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org
Date: Mon, 24 Feb 2025 09:54:27 +0100
In-Reply-To: <20250224055936.1804279-3-ryan_chen@aspeedtech.com>
References: <20250224055936.1804279-1-ryan_chen@aspeedtech.com>
	 <20250224055936.1804279-3-ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_005458_815244_8B78AD77 
X-CRM114-Status: GOOD (  17.77  )
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

On Mo, 2025-02-24 at 13:59 +0800, Ryan Chen wrote:
> Add i2c new register mode driver to support AST2600 i2c
> new register mode. AST2600 i2c controller have legacy and
> new register mode. The new register mode have global register
> support 4 base clock for scl clock selection, and new clock
> divider mode. The new register mode have separate register
> set to control i2c controller and target. This patch is for i2c
> controller mode driver.
>=20
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  drivers/i2c/busses/Kconfig       |   11 +
>  drivers/i2c/busses/Makefile      |    1 +
>  drivers/i2c/busses/i2c-ast2600.c | 1036 ++++++++++++++++++++++++++++++
>  3 files changed, 1048 insertions(+)
>  create mode 100644 drivers/i2c/busses/i2c-ast2600.c
>=20
[...]
> diff --git a/drivers/i2c/busses/i2c-ast2600.c b/drivers/i2c/busses/i2c-as=
t2600.c
> new file mode 100644
> index 000000000000..bfac507693dd
> --- /dev/null
> +++ b/drivers/i2c/busses/i2c-ast2600.c
> @@ -0,0 +1,1036 @@
[...]
> +static int ast2600_i2c_probe(struct platform_device *pdev)
> +{
> +	struct device *dev =3D &pdev->dev;
> +	struct ast2600_i2c_bus *i2c_bus;
> +	struct resource *res;
> +	u32 global_ctrl;
> +	int ret;
> +
> +	i2c_bus =3D devm_kzalloc(dev, sizeof(*i2c_bus), GFP_KERNEL);
> +	if (!i2c_bus)
> +		return -ENOMEM;
> +
> +	i2c_bus->reg_base =3D devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(i2c_bus->reg_base))
> +		return PTR_ERR(i2c_bus->reg_base);
> +
> +	i2c_bus->rst =3D devm_reset_control_get_shared(dev, NULL);
> +	if (IS_ERR(i2c_bus->rst))
> +		return dev_err_probe(dev, PTR_ERR(i2c_bus->rst), "Missing reset ctrl\n=
");
> +
> +	reset_control_deassert(i2c_bus->rst);

No reset_control_assert() in the error paths below? You could get that
and simplify this by using devm_reset_control_get_shared_deasserted().

regards
Philipp

