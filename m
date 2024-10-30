Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C195D5CCA1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 12:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWgQKaEJsBWQZzZRi7igT98SmnXpUOoVlYgKJAFqdSY=; b=IjFqYRvvVxQkITI7fYemV7s6S2
	J1/SKwyjlpowWzD72smMxs8jElo0OrpXOTDPNBBx6awcX0/+YGLQ9wS8Tob5PsXuR1j+sSOPnsE5e
	GD2kk5wW0pUH5qnz1RWZh3O6T+PLHW0bp1pscTC1jT2xv8o+KtyVVoHRTkmnDfTQbAHl4vE4u3yaJ
	1lVjNo5x5rKhy1rcek1o05SFFYZ5tpyf/1sUnivJgztZ3npQ8DvDIsB4pk2UyqtOCI8N+CZvTJNgX
	M4menzkOaAO+Mmg+fy/I4KzmOt+v1qXdWyk08Ug1tb0zFZEPTCQnYkTbYwyfb5ZzQq3VC+q7yld4r
	PCoMIWzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t67PI-00000000FgA-2sa0;
	Wed, 30 Oct 2024 12:02:36 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t67Gn-00000000EEL-3yLA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 11:53:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.net;
	s=s31663417; t=1730289219; x=1730894019; i=wahrenst@gmx.net;
	bh=MWgQKaEJsBWQZzZRi7igT98SmnXpUOoVlYgKJAFqdSY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=cSmHCIOUCj++5LC7QhLejuOpztGP6jWT/gxtBDFUumvabHlm/Y2gG+Hd2jd4/Q62
	 qxVsIyOj3++GVRcY9V2sDz6ym16Vr9wgLUt/QTvuIEuTGXSVjs6LzAJSQjxBElRKI
	 THUuTv4B5ZPER87my1uGE9U8vuCc1y3LEY3HrMG/iMCE4tFFSuoZS24pwJfZNfguI
	 AYyh2af6sgy+LhKtkxZI9WwTFRYs1HWwURffRMUbLiRbrSAkdXvG8IOTk0XMKmnIZ
	 rFEyTcxBiAFWFSzndp9KfqIc76gvSNPo1BegWudSLbGTNxeLK3Pv5+vPnD55Ezzg1
	 gMf285AT9i4RsM8kGg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.1.105] ([37.4.248.43]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MLi8m-1tNmdv1jhg-00RLek; Wed, 30
 Oct 2024 12:53:39 +0100
Message-ID: <9e239176-b1f2-45ef-a731-636f5a78aaa2@gmx.net>
Date: Wed, 30 Oct 2024 12:53:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] soc: imx: Add SoC device register for i.MX9
To: alice.guo@oss.nxp.com, alexander.stein@ew.tq-group.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com
Cc: imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, "alice.guo" <alice.guo@nxp.com>
References: <20241030091336.3901440-1-alice.guo@oss.nxp.com>
Content-Language: en-US
From: Stefan Wahren <wahrenst@gmx.net>
In-Reply-To: <20241030091336.3901440-1-alice.guo@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:nAU/v9tnjeYaZL9gXJfznUoO/fGQeGzQLDk/lF7wlo2mLonJGd8
 t3ckT9k1biAyNLgNra5/5wtPNnTm8gyTPWUlP7Ch7cDp8P8SqYKy8/yDlque1t9yHCjuimA
 mDINeeHSDyJB/T+4wYW0W1jwaILpOEXXwa9oe2rFXysQ6er7tNs081a3dq4Dyn4ZpdhX6O0
 kMbDQz2zLUXbM9lel5hHQ==
UI-OutboundReport: notjunk:1;M01:P0:BkUbYhaiXek=;btPbuJ7l9uQvmb9M0f39zfxZrgj
 DEofWF3td4ONEWcaus8DgpUWv9xtX+VFnPbjEWUIpyfHrPfG6GBLM7SFgVsUzikqpNmmpvWIx
 6phsJqVAU7VL1kvP+XwW4eIczmx7PDLRBcEv7bHAzgDZktQGcWMQWf66fZqbFJKnDT5RN46hV
 9MyJ6vbd1GV3LOZJDTqhyq4j1SCYJZn9FnBa9AhJ3f+eDBEDNxnx3wnLuttf2aiRaDoam0/Vy
 jT4YEgb9TkFfdgNPM6NA2sEirS/czPjXWzV6Rk+G4n/KuUkfbpMGKp47w/KYc9nmQ8UTpD1Ma
 SJyQ8VjFdwiWYX0KvDt0QFKent+De1GoP3fLZE0ttEAd2/d/ztamJqe5FSFnK69zXQCpFMeam
 Ezv4tzeFTQfhSmDXf52Ybtshl9grM31NURhHGDkVe2AyxKLAfvzE9mGmiSNLmw26Q99/FphPx
 pJGS+AXQYeDyG4I5nKPTFfWoEwwaa/PYi7kiizBKKvgc3wFD1YgZyJl82PCoSO7U36UrO5dyU
 DplX1exVT/pmjh3KnyTRnopz57985EMzO/5AmHkoApLIthcQtJpsNvi1vww8qvisOwmMq0JMB
 8wkPAQ3cWqGbjWqhzqX0GUgXW7O9lxhPKytMg07x1Jj0NVn3WrGK8l6hMZ9n+F3VaDPHxdSXB
 aao65i4aR/ftTarXObooCyodMK6XK8/TEEmGGbvbpTQElzjRO4ScRZRZKzda3fFlXUYLLBdc8
 SbyEvINex49v3VS5LEo7zHeNLRwYvhwx6TG1TGX3kvxHSTY3R7GAS2EH9iYHqecxOSQMp6AF4
 tPp2NFpcJ/SMHzKq4Hq//Vsg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_045350_325677_1A4FB0DB 
X-CRM114-Status: GOOD (  25.88  )
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

Am 30.10.24 um 10:13 schrieb alice.guo@oss.nxp.com:
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
> Changes for v3:
>   - return -EINVAL when arm_smccc_smc failed
>   - fix the build warning caused by pr_err("%s: SMC failed: %d\n", __func__, res.a0);
>   - drop the pr_err in imx9_soc_init
>   - free the memory in the reverse order of allocation
>   - use of_match_node instead of of_machine_is_compatible
>
>   drivers/soc/imx/Makefile   |   2 +-
>   drivers/soc/imx/soc-imx9.c | 106 +++++++++++++++++++++++++++++++++++++
>   2 files changed, 107 insertions(+), 1 deletion(-)
>   create mode 100644 drivers/soc/imx/soc-imx9.c
>
> diff --git a/drivers/soc/imx/Makefile b/drivers/soc/imx/Makefile
> index 3ad321ca608a..ca6a5fa1618f 100644
> --- a/drivers/soc/imx/Makefile
> +++ b/drivers/soc/imx/Makefile
> @@ -3,4 +3,4 @@ ifeq ($(CONFIG_ARM),y)
>   obj-$(CONFIG_ARCH_MXC) += soc-imx.o
>   endif
>   obj-$(CONFIG_SOC_IMX8M) += soc-imx8m.o
> -obj-$(CONFIG_SOC_IMX9) += imx93-src.o
> +obj-$(CONFIG_SOC_IMX9) += imx93-src.o soc-imx9.o
> diff --git a/drivers/soc/imx/soc-imx9.c b/drivers/soc/imx/soc-imx9.c
> new file mode 100644
> index 000000000000..823395584533
> --- /dev/null
> +++ b/drivers/soc/imx/soc-imx9.c
> @@ -0,0 +1,106 @@
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
> +	attr = kzalloc(sizeof(*attr), GFP_KERNEL);
> +	if (!attr)
> +		return -ENOMEM;
> +
> +	err = of_property_read_string(of_root, "model", &attr->machine);
> +	if (err) {
> +		pr_err("%s: missing model property: %d\n", __func__, err);
> +		goto attr;
> +	}
> +
> +	attr->family = kasprintf(GFP_KERNEL, "Freescale i.MX");
> +
> +	/*
> +	 * Retrieve the soc id, rev & uid info:
> +	 * res.a1[31:16]: soc revision;
> +	 * res.a1[15:0]: soc id;
> +	 * res.a2: uid[127:64];
> +	 * res.a3: uid[63:0];
> +	 */
> +	arm_smccc_smc(IMX_SIP_GET_SOC_INFO, 0, 0, 0, 0, 0, 0, 0, &res);
> +	if (res.a0 != SMCCC_RET_SUCCESS) {
> +		pr_err("%s: SMC failed: 0x%lx\n", __func__, res.a0);
> +		err = -EINVAL;
> +		goto family;
> +	}
> +
> +	soc_id = SOC_ID(res.a1);
> +	rev_major = SOC_REV_MAJOR(res.a1);
> +	rev_minor = SOC_REV_MINOR(res.a1);
> +
> +	attr->soc_id = kasprintf(GFP_KERNEL, "i.MX%2x", soc_id);
> +	attr->revision = kasprintf(GFP_KERNEL, "%d.%d", rev_major, rev_minor);
> +
> +	uid127_64 = res.a2;
> +	uid63_0 = res.a3;
> +	attr->serial_number = kasprintf(GFP_KERNEL, "%016llx%016llx", uid127_64, uid63_0);
> +
> +	sdev = soc_device_register(attr);
> +	if (IS_ERR(sdev)) {
> +		err = PTR_ERR(sdev);
> +		pr_err("%s failed to register SoC as a device: %d\n", __func__, err);
> +		goto serial_number;
> +	}
> +
> +	return 0;
> +
> +serial_number:
> +	kfree(attr->serial_number);
> +	kfree(attr->revision);
> +	kfree(attr->soc_id);
> +family:
> +	kfree(attr->family);
> +attr:
> +	kfree(attr);
> +	return err;
> +}
> +
> +static const struct of_device_id imx9_soc_match[] = {
> +	{ .compatible = "fsl,imx93", },
> +	{ .compatible = "fsl,imx95", },
What happend to fsl,imx91 ?

Best regards

