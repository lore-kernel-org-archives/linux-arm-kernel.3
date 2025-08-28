Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D206CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 01:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	Subject:Cc:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zh4gg928dw0RcQqkQ+B/Q+DIbmhDWNYxBITUkGAsJBQ=; b=CfpwwycwhuxCF2pJTPAyZZ8Czt
	lAZQ9JEakowbrYrsp3crIZ1peIDzxr8meUUJglxl67XuGob8hFFOJlKBKMzfu+tQIrE0m2w5npHGP
	Y6+KcX5ioj7D9YFz/jC+Nzy0hPI00JgiNh6p9bmn/JOiVeM4Wz0n9JcryK344OGB9Gn+1FWNNIL0b
	hDL1p8r5ruSZms7Bqn0Bkw9ui3zs31IP1yhpPKuiQnD61wYPgJ5p0yphQLTGeu98tTEP7a89GIeqL
	x9qSlOjs6bZGKqvoEUbPpxSvMoyo7a5rxAJAaiMU7DYPkAbsK2HNVzQkpbZm6HFWO92QNjRw3Dxwv
	dVLzNzEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urndU-00000003xWI-21Xb;
	Fri, 29 Aug 2025 01:10:36 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uritJ-0000000387J-0jZ8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 20:06:38 +0000
DKIM-Signature: a=rsa-sha256; b=owmaGhNgfaOD+znx/GojLIb2t38ZD4Jrl1iYxrYo6B4VOkxVOFhOEi2oNv/m5+yW0lF+EFo0TPpX4Dd6FXITgreGaiI4YED3URfoCsWXgJIj8A44OSMG+RM+DKNhOlaTsNlycsYNxF2Z7SiV0zs3Anhw+610gir2iyFKo2zASmCC1s8pRHV9E8tQUvFqfNLGej99GLBac1nJJ3GHeLuanuAx75JhlT31ounVZQ+kJNPlxJwx/tZGMTqdlrhfZG3L/P312jy6vpYonIx2v8CEs57KmC4X/jpCeNcuJ0TFRbaTeuLi3XLWWp+W3lMcNSEOhEt0GR3iRXYGZSXGRk1Gsg==; s=purelymail1; d=purelymail.com; v=1; bh=u9TsNJz5Cli+hy1QKsrKbomaP8wVYfx+FZl2Clzk1tg=; h=Feedback-ID:Received:Date:To:Subject:From;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 1961342606;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Thu, 28 Aug 2025 20:06:27 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 Aug 2025 22:06:25 +0200
Message-Id: <DCEBXZ0J8PYY.1D1SFSURUN457@mentallysanemainliners.org>
To: "Arseniy Velikanov" <me@adomerle.pw>
Cc: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <~postmarketos/upstreaming@lists.sr.ht>
Subject: Re: [PATCH v1 2/2] phy: mediatek: tphy: Add software role switching
From: "Igor Belwon" <igor.belwon@mentallysanemainliners.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250814234825.810-1-me@adomerle.pw>
 <20250814234825.810-2-me@adomerle.pw>
In-Reply-To: <20250814234825.810-2-me@adomerle.pw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_130637_309774_2D089FCA 
X-CRM114-Status: GOOD (  24.85  )
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

Hi Arseniy,

On Fri Aug 15, 2025 at 1:48 AM CEST, Arseniy Velikanov wrote:
> MediaTek USB T-PHY has broken role switching on (likely) all mobile SoCs.
> Known affected socs are: MT6735, MT6757, MT6761, MT6765, MT6768, MT6771,
> MT6785, MT6789.
>
> The downstream kernel manually controls the PHY mode by writing
> "test mode" FORCE regs. Setting all these regs fixes device/host modes, b=
ut
> breaks dual-role functionality. As a workaround we use workqueue that
> periodically checks the USB role and changes the PHY mode accordingly.
>
> To address this issue only on affected SoCs, we introduce a new
> device-tree property `mediatek,software-role-switch`. This ensures
> the workaround is applied only to broken hardware while leaving unaffecte=
d
> devices (like Chromebooks) untouched.
>
> Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
> ---
>  drivers/phy/mediatek/phy-mtk-tphy.c | 148 ++++++++++++++++++++++++++++
>  1 file changed, 148 insertions(+)
>
> diff --git a/drivers/phy/mediatek/phy-mtk-tphy.c b/drivers/phy/mediatek/p=
hy-mtk-tphy.c
> index f6504e0ecd1a..472859ec929c 100644
> --- a/drivers/phy/mediatek/phy-mtk-tphy.c
> +++ b/drivers/phy/mediatek/phy-mtk-tphy.c
> @@ -18,6 +18,9 @@
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> +#include <linux/usb/role.h>
> +#include <linux/usb/otg.h>
> +#include <linux/workqueue.h>
> =20
>  #include "phy-mtk-io.h"
> =20
> @@ -111,11 +114,18 @@
> =20
>  #define U3P_U2PHYDTM1		0x06C
>  #define P2C_RG_UART_EN			BIT(16)
> +#define P2C_FORCE_IDPULLUP	BIT(8)
>  #define P2C_FORCE_IDDIG		BIT(9)
> +#define P2C_FORCE_AVALID	BIT(10)
> +#define P2C_FORCE_SESSEND	BIT(12)
> +#define P2C_FORCE_VBUSVALID	BIT(13)
> +
>  #define P2C_RG_VBUSVALID		BIT(5)
>  #define P2C_RG_SESSEND			BIT(4)
> +#define P2C_RG_BVALID			BIT(3)
>  #define P2C_RG_AVALID			BIT(2)
>  #define P2C_RG_IDDIG			BIT(1)
> +#define P2C_RG_IDPULLUP			BIT(0)
> =20
>  #define U3P_U2PHYBC12C		0x080
>  #define P2C_RG_CHGDT_EN		BIT(0)
> @@ -317,6 +327,8 @@ struct mtk_phy_instance {
>  		struct u3phy_banks u3_banks;
>  	};
>  	struct clk_bulk_data clks[TPHY_CLKS_CNT];
> +	struct delayed_work dr_work;
> +	struct usb_role_switch *role_switch;
>  	u32 index;
>  	u32 type;
>  	struct regmap *type_sw;
> @@ -326,14 +338,17 @@ struct mtk_phy_instance {
>  	u32 efuse_intr;
>  	u32 efuse_tx_imp;
>  	u32 efuse_rx_imp;
> +	int current_role;
>  	int eye_src;
>  	int eye_vrt;
>  	int eye_term;
>  	int intr;
>  	int discth;
>  	int pre_emphasis;
> +	int sw_get_retries;
>  	bool bc12_en;
>  	bool type_force_mode;
> +	bool software_role_switch;
>  };
> =20
>  struct mtk_tphy {
> @@ -818,12 +833,118 @@ static void u2_phy_pll_26m_set(struct mtk_tphy *tp=
hy,
>  			 P2R_RG_U2PLL_FRA_EN | P2R_RG_U2PLL_REFCLK_SEL);
>  }
> =20
> +static void u2_phy_instance_role_set(struct mtk_phy_instance *instance,
> +				     int role)
> +{
> +	struct u2phy_banks *u2_banks =3D &instance->u2_banks;
> +	void __iomem *com =3D u2_banks->com;
> +
> +	instance->current_role =3D role;
> +
> +	/* end session before role switch */
> +	mtk_phy_set_bits(com + U3P_U2PHYDTM1, P2C_RG_SESSEND);
> +	mdelay(5);
> +	mtk_phy_clear_bits(com + U3P_U2PHYDTM1, P2C_RG_SESSEND);
> +
> +	switch (role) {
> +	case USB_ROLE_DEVICE:
> +		dev_dbg(&instance->phy->dev, "set device role\n");
> +		mtk_phy_set_bits(com + U3P_U2PHYDTM1, P2C_RG_IDDIG);
> +		break;
> +	case USB_ROLE_HOST:
> +		dev_dbg(&instance->phy->dev, "set host role\n");
> +		mtk_phy_clear_bits(com + U3P_U2PHYDTM1, P2C_RG_IDDIG);
> +		break;
> +	default:
> +		break;
> +	}
> +}
> +
> +static void u2_phy_role_switch_work(struct work_struct *work)
> +{
> +	struct mtk_phy_instance *instance =3D
> +		container_of(work, struct mtk_phy_instance, dr_work.work);
> +	int role;
> +
> +	if (IS_ERR_OR_NULL(instance->role_switch))
> +		instance->role_switch =3D usb_role_switch_get(&instance->phy->dev);
> +
> +	if (IS_ERR_OR_NULL(instance->role_switch)) {
> +		if (instance->sw_get_retries >=3D 10) {
> +			dev_warn(&instance->phy->dev, "failed to get role switch\n");
> +			return;
> +		}
> +
> +		instance->sw_get_retries +=3D 1;
> +		schedule_delayed_work(&instance->dr_work, msecs_to_jiffies(500));
> +	}
> +
> +	role =3D usb_role_switch_get_role(instance->role_switch);
> +
> +	if (instance->current_role =3D=3D role)
> +		goto reschedule_work;
> +
> +	u2_phy_instance_role_set(instance, role);
> +
> +reschedule_work:
> +	schedule_delayed_work(&instance->dr_work, msecs_to_jiffies(100));
> +}
> +
> +static int u2_phy_software_role_switch_init(struct mtk_phy_instance *ins=
tance)
> +{
> +	struct fwnode_handle *ep, *remote_ep, *usb_fwnode;
> +	struct device *usb_dev;
> +	int mode;
> +
> +	instance->sw_get_retries =3D 0;
> +
> +	ep =3D fwnode_graph_get_endpoint_by_id(dev_fwnode(&instance->phy->dev),
> +					     0,
> +					     0,
> +					     FWNODE_GRAPH_ENDPOINT_NEXT);
> +	if (!ep)
> +		return -ENODEV;
> +
> +	remote_ep =3D fwnode_graph_get_remote_endpoint(ep);
> +	fwnode_handle_put(ep);
> +	if (!remote_ep)
> +		return -ENODEV;
> +
> +	usb_fwnode =3D fwnode_graph_get_port_parent(remote_ep);
> +	fwnode_handle_put(remote_ep);
> +
> +	if (!usb_fwnode)
> +		return -ENODEV;
> +
> +	usb_dev =3D bus_find_device_by_fwnode(&platform_bus_type, usb_fwnode);
> +	fwnode_handle_put(usb_fwnode);
> +	if (!usb_dev)
> +		return -ENODEV;
> +
> +	mode =3D usb_get_role_switch_default_mode(usb_dev);
> +	if (mode =3D=3D USB_DR_MODE_HOST)
> +		u2_phy_instance_role_set(instance, USB_ROLE_HOST);
> +	else
> +		u2_phy_instance_role_set(instance, USB_ROLE_DEVICE);
> +
> +	INIT_DELAYED_WORK(&instance->dr_work, u2_phy_role_switch_work);
> +
> +	return 0;
> +}
> +
>  static void u2_phy_instance_init(struct mtk_tphy *tphy,
>  	struct mtk_phy_instance *instance)
>  {
>  	struct u2phy_banks *u2_banks =3D &instance->u2_banks;
>  	void __iomem *com =3D u2_banks->com;
>  	u32 index =3D instance->index;
> +	int ret;
> +
> +	if (instance->software_role_switch) {
> +		ret =3D u2_phy_software_role_switch_init(instance);
> +		if (ret)
> +			dev_warn(&instance->phy->dev, "failed to initialize role switching\n"=
);
> +	}
> =20
>  	/* switch to USB function, and enable usb pll */
>  	mtk_phy_clear_bits(com + U3P_U2PHYDTM0, P2C_FORCE_UART_EN | P2C_FORCE_S=
USPENDM);
> @@ -883,6 +1004,18 @@ static void u2_phy_instance_power_on(struct mtk_tph=
y *tphy,
> =20
>  		mtk_phy_set_bits(com + U3P_U2PHYDTM0, P2C_RG_SUSPENDM | P2C_FORCE_SUSP=
ENDM);
>  	}
> +
> +	if (instance->software_role_switch) {
> +		/* Set FORCE modes for manual role switching */
> +		mtk_phy_set_bits(com + U3P_U2PHYDTM1, P2C_FORCE_IDPULLUP
> +			| P2C_FORCE_IDDIG | P2C_FORCE_AVALID | P2C_FORCE_VBUSVALID
> +			| P2C_FORCE_SESSEND);
> +		mtk_phy_set_bits(com + U3P_U2PHYDTM1, P2C_RG_IDPULLUP | P2C_RG_BVALID)=
;
> +
> +		if (!instance->role_switch)
> +			schedule_delayed_work(&instance->dr_work, msecs_to_jiffies(100));
> +	}
> +
>  	dev_dbg(tphy->dev, "%s(%d)\n", __func__, index);
>  }
> =20
> @@ -906,6 +1039,9 @@ static void u2_phy_instance_power_off(struct mtk_tph=
y *tphy,
>  		mtk_phy_clear_bits(com + U3D_U2PHYDCR0, P2C_RG_SIF_U2PLL_FORCE_ON);
>  	}
> =20
> +	if (instance->role_switch)
> +		cancel_delayed_work_sync(&instance->dr_work);
> +
>  	dev_dbg(tphy->dev, "%s(%d)\n", __func__, index);
>  }
> =20
> @@ -940,6 +1076,9 @@ static void u2_phy_instance_set_mode(struct mtk_tphy=
 *tphy,
>  		tmp &=3D ~P2C_RG_IDDIG;
>  		break;
>  	case PHY_MODE_USB_OTG:
> +		/* We are managing role in workqueue */
> +		if (instance->software_role_switch)
> +			return;
>  		tmp &=3D ~(P2C_FORCE_IDDIG | P2C_RG_IDDIG);
>  		break;
>  	default:
> @@ -1129,6 +1268,11 @@ static void phy_parse_property(struct mtk_tphy *tp=
hy,
>  	if (instance->type =3D=3D PHY_TYPE_USB3)
>  		instance->type_force_mode =3D device_property_read_bool(dev, "mediatek=
,force-mode");
> =20
> +	instance->software_role_switch =3D
> +		device_property_read_bool(dev, "mediatek,software-role-switch");
> +	if (instance->software_role_switch)
> +		dev_info(dev, "software role switch enabled\n");
> +
>  	if (instance->type !=3D PHY_TYPE_USB2)
>  		return;
> =20
> @@ -1618,6 +1762,10 @@ static int mtk_tphy_probe(struct platform_device *=
pdev)
>  		struct phy *phy;
>  		int retval;
> =20
> +		/* filter non-phy nodes (e.g. graphs) */
> +		if (!of_find_property(child_np, "reg", NULL))
> +			continue;
> +
>  		instance =3D devm_kzalloc(dev, sizeof(*instance), GFP_KERNEL);
>  		if (!instance)
>  			return -ENOMEM;

This patch made USB role-switching work on the MT6878 SoC. As such:

Tested-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>

Kind regards,
Igor

