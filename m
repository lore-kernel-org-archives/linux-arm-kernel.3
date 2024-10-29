Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA431D2AB01
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 09:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UdHybwxJHfIWWeB1x52ApmSTqen0m8Kxqryhs4Fqv4A=; b=03JJw27mhSG08LOA50F23bMCDk
	fcnkMND1S4iBF8YI7FqG2zP1cqWIAWe4pOvoXLWo/N1NZ3JA2N4602sqpwtIOUgziPpToZ+C6QQ3Z
	fc5i9ZQEadKDDlACmGe1qMABDIUBcqWeszQ1B/1Cc8QFWi2D+ty4+QO+GMfQ7QUAHcsq37jZFJ9wW
	8cCr1s9mNJpiNy9QApTVuXFiYT/LGfZsDrfFXRWzalnJC+i0VWcs6ksHx514+taI8sw8ZsOFjWX5S
	3dNobawWprXMPgyyXnmRNTlzVwpW8ZPkvhTDejeorOI+5FD6u9uI06rZIG+y9Cz9lSw9u3dmyvK5u
	n+Jr6tUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5iMZ-0000000Dqu3-1iQI;
	Tue, 29 Oct 2024 09:18:07 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5iHl-0000000DqJJ-1ocs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 09:13:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1730193182; x=1730797982; i=wahrenst@gmx.net;
	bh=UdHybwxJHfIWWeB1x52ApmSTqen0m8Kxqryhs4Fqv4A=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=duCfu6Gfqx+34r3pyTqsQqywfu13oudJVvlm36ekCORHWA4Qu3ZYo4OjeAPLU+Df
	 DC1p4BoFvgRI829gfbrX+tr0dTIcVcbtaaZ3mq7qJBcx4k8zwS2VYbBEYjKTfArlJ
	 TfLSfC3NC4ZqKHcpWVZgqt4xFJMy6uJ3IW8UrIZdyBCUGCy7vhrvAY4iNFNne2WcM
	 2vhSDuRAI2CmXN097rYUoc3FYKpJicHhdtihe0Qn57GENh45JujFNap2gr44WxRTf
	 H4U/w6Tn7zLWM5etss7psCFWEwxDkvcD6wjtTpBGPoSvoPrepkj7Y+iQxdnchgVW/
	 T6tiPN+eT8b5WIWHvA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N79yQ-1tvKT41OZg-00zcQ5; Tue, 29
 Oct 2024 10:13:02 +0100
Message-ID: <30bd4862-daa9-41bb-95dc-990ea462dc95@gmx.net>
Date: Tue, 29 Oct 2024 10:13:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] soc: imx: Add SoC device register for i.MX9
To: alice.guo@oss.nxp.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, "alice.guo" <alice.guo@nxp.com>
References: <20241029083406.3888861-1-alice.guo@oss.nxp.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20241029083406.3888861-1-alice.guo@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:47lZj0L2HimalgwtdkzW8j/307ghRkB+c6p1VmAszfCxoXW1k7m
 +vXl+4d5OqAz92YgmOpiPs7FDVYiRPvc/12AZbKjtygEaZgh4w4Iv/xGH8UiY8sO3jRXZoX
 /uwcPIjqFLaeaz9W1A3Kj7Vxkej07z1DmT0A8xh6/XEz7bmz5xkQ53x8TROrIjtOYbAAOcV
 b7ZMVs8zDAJM+r943s9Hw==
UI-OutboundReport: notjunk:1;M01:P0:nrNEsX5f0I8=;8y1FJ4HfOGy/tAv5yhc6qIYJ3rt
 Ef4fSVxvAVFsN3Map/PVaK3jv4brMUHLuD5KB9KK3JtqUteePoXuoKD1Xy+TJzn4xT3zHRltx
 D1Uj6z8dxBjv+jwNDq1m7Ro5UZO5mUEUwfFX2773gjs40WQ5AqL0mVxDFhgxNzvlHE0l0hN8g
 gcoZSvNwcQ9/pDb9StwWbaB8xSwIPFrDJibqw5CwotoWyDT9o4M4YPXJcnFUyeG7tk87a/qbI
 ZQv22l4Mfb5TbzokejA54PIOa1rljoVkzk4dmNAFfrVBAmSMNv490CxNAtlx1y44pCKvaD1E1
 DI3FBvGHvAmoE4EvgmPUo/1hhJZLf4Fm+AsOFe8VcNbvtaP+2f4AoT/2zajo3Otz8Iun6uhQd
 QFiBWy537W/G/49R4dIZxxt3diz75h5Xc36Gsif4TBy4K4k6hCkw9whEyltAV7Hmu3MuriFho
 /PKjq8TsSnftWVUCdbLu0aP9dOBMYStAM6Iy+y8JnpNN8wSMA27L/oYeyc9UUq/BY56+9E788
 oKFiz+v9wdKV8EOFZ+/S9T+UEpN3LyrP6DsresvFyDB+hB1HtGFLGQ0VXo+9/ZGpveUjU4Uwq
 Uvpja5ECBlzkNmtjEUatpbfjP2ZzQS1ejb3csBjt8IAgaC5X2mYcoSveGUbPt0XesLyudj1dU
 SRQBr8br83lwAx1nJw80PvNhHGxZrNnfYoNFjJT6cjASgzgZwXFH4E0vFO5f1RHJ49UeekIY4
 9lOu0Q7MqW+PA+NwGGf4KZhLMbADea7XpswQUAkcvl/dN1UeoRUsKvLsos83TPaBtNYfPNuWw
 nAS+IgD/P1QT5Hv7aqEuNXwA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_021309_786687_1E738235 
X-CRM114-Status: GOOD (  25.46  )
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

Hi Alice,

Am 29.10.24 um 09:34 schrieb alice.guo@oss.nxp.com:
> From: "alice.guo" <alice.guo@nxp.com>
>
> i.MX9 SoCs have SoC ID, SoC revision number and chip unique identifier
> which are provided by the corresponding ARM trusted firmware API. This
> patch intends to use SMC call to obtain these information and then
> register i.MX9 SoC as a device.
>
> Signed-off-by: alice.guo <alice.guo@nxp.com>
> ---
>
> Changes for v2:
>   - refine error log print
>
>   drivers/soc/imx/Makefile   |   2 +-
>   drivers/soc/imx/soc-imx9.c | 103 +++++++++++++++++++++++++++++++++++++
>   2 files changed, 104 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/soc/imx/soc-imx9.c
>
> diff --git a/drivers/soc/imx/Makefile b/drivers/soc/imx/Makefile
> index 3ad321ca608a..ca6a5fa1618f 100644
> --- a/drivers/soc/imx/Makefile
> +++ b/drivers/soc/imx/Makefile
> @@ -3,4 +3,4 @@ ifeq ($(CONFIG_ARM),y)
>   obj-$(CONFIG_ARCH_MXC) +=3D soc-imx.o
>   endif
>   obj-$(CONFIG_SOC_IMX8M) +=3D soc-imx8m.o
> -obj-$(CONFIG_SOC_IMX9) +=3D imx93-src.o
> +obj-$(CONFIG_SOC_IMX9) +=3D imx93-src.o soc-imx9.o
> diff --git a/drivers/soc/imx/soc-imx9.c b/drivers/soc/imx/soc-imx9.c
> new file mode 100644
> index 000000000000..0722e69110f9
> --- /dev/null
> +++ b/drivers/soc/imx/soc-imx9.c
> @@ -0,0 +1,103 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright 2024 NXP
> + */
> +
> +#include <linux/arm-smccc.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/slab.h>
> +#include <linux/sys_soc.h>
> +
> +#define IMX_SIP_GET_SOC_INFO	0xc2000006
> +#define SOC_ID(x)		(((x) & 0xFFFF) >> 8)
> +#define SOC_REV_MAJOR(x)	((((x) >> 28) & 0xF) - 0x9)
> +#define SOC_REV_MINOR(x)	(((x) >> 24) & 0xF)
> +
> +static int imx9_soc_device_register(void)
> +{
> +	struct soc_device_attribute *attr;
> +	struct arm_smccc_res res;
> +	struct soc_device *sdev;
> +	u32 soc_id, rev_major, rev_minor;
> +	u64 uid127_64, uid63_0;
> +	int err;
> +
> +	attr =3D kzalloc(sizeof(*attr), GFP_KERNEL);
> +	if (!attr)
> +		return -ENOMEM;
> +
> +	err =3D of_property_read_string(of_root, "model", &attr->machine);
> +	if (err) {
> +		pr_err("%s: missing model property: %d\n", __func__, err);
> +		goto attr;
> +	}
> +
> +	attr->family =3D kasprintf(GFP_KERNEL, "Freescale i.MX");
> +
> +	/*
> +	 * Retrieve the soc id, rev & uid info:
> +	 * res.a1[31:16]: soc revision;
> +	 * res.a1[15:0]: soc id;
> +	 * res.a2: uid[127:64];
> +	 * res.a3: uid[63:0];
> +	 */
> +	arm_smccc_smc(IMX_SIP_GET_SOC_INFO, 0, 0, 0, 0, 0, 0, 0, &res);
> +	if (res.a0 !=3D SMCCC_RET_SUCCESS) {
> +		pr_err("%s: SMC failed: %d\n", __func__, res.a0);
> +		err =3D res.a0;
The pr_err() looks good to me. But in this specific case, I would stick
with assigning -EINVAL to err, because the SMCCC_RET.. codes are
completely different from Linux. I wasn't clear about that in my last
comment.
> +		goto family;
> +	}
> +
> +	soc_id =3D SOC_ID(res.a1);
> +	rev_major =3D SOC_REV_MAJOR(res.a1);
> +	rev_minor =3D SOC_REV_MINOR(res.a1);
> +
> +	attr->soc_id =3D kasprintf(GFP_KERNEL, "i.MX%2x", soc_id);
> +	attr->revision =3D kasprintf(GFP_KERNEL, "%d.%d", rev_major, rev_minor=
);
> +
> +	uid127_64 =3D res.a2;
> +	uid63_0 =3D res.a3;
> +	attr->serial_number =3D kasprintf(GFP_KERNEL, "%016llx%016llx", uid127=
_64, uid63_0);
> +
> +	sdev =3D soc_device_register(attr);
> +	if (IS_ERR(sdev)) {
> +		err =3D PTR_ERR(sdev);
pr_err("%s: failed to register SoC as a device: %d\n", __func__, err);

After that we can drop the pr_err() in imx9_soc_init() and avoid
unnecessary error logs.
> +		goto soc_id;
> +	}
> +
> +	return 0;
> +
> +soc_id:
> +	kfree(attr->soc_id);
> +	kfree(attr->serial_number);
> +	kfree(attr->revision);
> +family:
> +	kfree(attr->family);
> +attr:
> +	kfree(attr);
> +	return err;
> +}
> +
> +static int __init imx9_soc_init(void)
> +{
> +	int ret =3D 0;
> +
> +	if (of_machine_is_compatible("fsl,imx91") ||
> +		of_machine_is_compatible("fsl,imx93") ||
> +		of_machine_is_compatible("fsl,imx95")) {
> +		ret =3D imx9_soc_device_register();
> +		if (ret) {
> +			pr_err("%s failed to register SoC as a device: %d\n", __func__, ret)=
;
> +			return ret;
> +		}
After dropping the pr_err we can get the rid of the complete condition
for ret.

Thanks
> +	}
> +
> +	return ret;
> +}
> +device_initcall(imx9_soc_init);
> +
> +MODULE_AUTHOR("NXP");
> +MODULE_DESCRIPTION("NXP i.MX9 SoC");
> +MODULE_LICENSE("GPL");


