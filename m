Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791C7C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 05:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jJKBYEa9rmr3kvyqLbAs5Ywz97Hji7oACJ4jFgIyWhw=; b=oEPtqG+5GeSbH4ZNrM0Gm2AngI
	zpOy8CJ2/VgoNoma24J0rHkqb377DcwG3lxY1rmf5SF5deIPZNukTSMkXRJ9tzYuuwQ/uucFWyC6w
	ARaBEEf2CpNQ4zPtwXdhf4endRzZ3A+FZsPU29GMHe9SOfTKHHeJ6tECoYHyvAkFZodZCFuh7mVXT
	aAMVGIWvUkL+rAI3j7UCWI2MS2xjSKBedXA+0Tl2VB4UzsPtRj2R0BUW3oxKk5+tduvpWvK7JsPwL
	fMNpbvdxJmfZ6VHIlRJzn43CCkzDxCKJ9PlLNzYvdxY5lhhbyFfLxH9xxztTKiI/0XrYau2Abw95P
	dQwwDpNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj8ix-000000087cv-2ANy;
	Mon, 13 Jul 2026 04:56:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj8iw-000000087cm-1sDL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 04:56:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C5D3C42E90;
	Mon, 13 Jul 2026 04:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 520441F000E9;
	Mon, 13 Jul 2026 04:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783918617;
	bh=jJKBYEa9rmr3kvyqLbAs5Ywz97Hji7oACJ4jFgIyWhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PBY+E11jlqgQQIDZUU5NB9ily54ng2B7A0IQ+x0NPi3w7IQmtXvMM+0UwvlBndEZ0
	 U7IRy2Zmfp/d2Q01FJuhFhlk7q3eKOffl+0iWGSaalhP7lyaepNkO9/1ZUe8AMBs01
	 Vousxc+DyINtJgVKHFZaNoUyJ1oLHWxyP4zFF6peyuFyNBCnG9Nk33Z8ol3Xj+pqQ8
	 eAPwklqg/O4gC5VAprHX1ofLAAOR8m5bLsHOBNy4x6wmkoLqpwm9IyI9Lbft7CvNAU
	 GKgANzx6p3Rfs+aFcYreUOj5Q7vVvsF7Kl4NOLXaGCd5KNvG3zJguTMvNgiFx+fP0F
	 Jb0+zqqfMSSiw==
Date: Mon, 13 Jul 2026 06:56:45 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: "Sherry Sun (OSS)" <sherry.sun@oss.nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, amitkumar.karwar@nxp.com, neeraj.sanjaykale@nxp.com, 
	marcel@holtmann.org, luiz.dentz@gmail.com, hongxing.zhu@nxp.com, 
	l.stach@pengutronix.de, lpieralisi@kernel.org, kwilczynski@kernel.org, 
	bhelgaas@google.com, brgl@kernel.org, imx@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-pm@vger.kernel.org, sherry.sun@nxp.com
Subject: Re: [PATCH V6 3/4] Bluetooth: btnxpuart: Add M.2 Bluetooth device
 support using pwrseq
Message-ID: <mow4vuf6zf6c7uzb7zbvwuw3b5p5q5rfghw266f2eiesvhssle@7jzavek52rt7>
References: <20260713023435.235765-1-sherry.sun@oss.nxp.com>
 <20260713023435.235765-4-sherry.sun@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260713023435.235765-4-sherry.sun@oss.nxp.com>
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

On Mon, Jul 13, 2026 at 10:34:34AM +0800, Sherry Sun (OSS) wrote:
> From: Sherry Sun <sherry.sun@nxp.com>
> 
> Power supply to the M.2 Bluetooth device attached to the host using M.2
> connector is controlled using the 'uart' pwrseq device. So add support
> for getting the pwrseq device if the OF graph link is present.
> 
> Once obtained, pwrseq_power_on() is called to power up the M.2 Bluetooth
> card. The power sequencer descriptor is obtained via pwrseq_get() with
> the UART controller device (serdev->ctrl->dev), since the OF graph
> link is defined on the UART controller node.
> 
> Also add the explicit pwrseq_put() call in all exit paths, pwrseq_put()
> already calls pwrseq_power_off() internally, so no separate
> pwrseq_power_off() call is needed.
> 
> Signed-off-by: Sherry Sun <sherry.sun@nxp.com>

Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> ---
> Hi Frank and Bartosz, this V6 patch using pwrseq_put() in all exit paths to
> fix the power sequencer reference leak issue during BT driver unload and
> reload as reported by sashiko. I'm keeping your Reviewed-by tag. I can
> remove it if you think it's inappropriate.
> ---
>  drivers/bluetooth/btnxpuart.c | 34 ++++++++++++++++++++++++++++++----
>  1 file changed, 30 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/bluetooth/btnxpuart.c b/drivers/bluetooth/btnxpuart.c
> index 0bb300eef157..81a11ac05114 100644
> --- a/drivers/bluetooth/btnxpuart.c
> +++ b/drivers/bluetooth/btnxpuart.c
> @@ -9,6 +9,8 @@
>  
>  #include <linux/serdev.h>
>  #include <linux/of.h>
> +#include <linux/of_graph.h>
> +#include <linux/pwrseq/consumer.h>
>  #include <linux/skbuff.h>
>  #include <linux/unaligned.h>
>  #include <linux/firmware.h>
> @@ -211,6 +213,7 @@ struct btnxpuart_dev {
>  
>  	struct ps_data psdata;
>  	struct btnxpuart_data *nxp_data;
> +	struct pwrseq_desc *pwrseq;
>  	struct reset_control *pdn;
>  	struct hci_uart hu;
>  };
> @@ -1872,11 +1875,26 @@ static int nxp_serdev_probe(struct serdev_device *serdev)
>  		return err;
>  	}
>  
> +	if (of_graph_is_present(dev_of_node(&serdev->ctrl->dev))) {
> +		struct pwrseq_desc *pwrseq;
> +
> +		pwrseq = pwrseq_get(&serdev->ctrl->dev, "uart");
> +		if (IS_ERR(pwrseq))
> +			return dev_err_probe(&serdev->dev, PTR_ERR(pwrseq),
> +					     "failed to get pwrseq\n");
> +
> +		nxpdev->pwrseq = pwrseq;
> +		err = pwrseq_power_on(pwrseq);
> +		if (err)
> +			goto err_pwrseq_put;
> +	}
> +
>  	/* Initialize and register HCI device */
>  	hdev = hci_alloc_dev();
>  	if (!hdev) {
>  		dev_err(&serdev->dev, "Can't allocate HCI device\n");
> -		return -ENOMEM;
> +		err = -ENOMEM;
> +		goto err_pwrseq_put;
>  	}
>  
>  	reset_control_deassert(nxpdev->pdn);
> @@ -1907,13 +1925,16 @@ static int nxp_serdev_probe(struct serdev_device *serdev)
>  	if (bacmp(&ba, BDADDR_ANY))
>  		hci_set_quirk(hdev, HCI_QUIRK_USE_BDADDR_PROPERTY);
>  
> -	if (hci_register_dev(hdev) < 0) {
> +	err = hci_register_dev(hdev);
> +	if (err < 0) {
>  		dev_err(&serdev->dev, "Can't register HCI device\n");
>  		goto probe_fail;
>  	}
>  
> -	if (ps_setup(hdev))
> +	if (ps_setup(hdev)) {
> +		err = -ENODEV;
>  		goto probe_fail_unregister;
> +	}
>  
>  	hci_devcd_register(hdev, nxp_coredump, nxp_coredump_hdr,
>  			   nxp_coredump_notify);
> @@ -1925,7 +1946,10 @@ static int nxp_serdev_probe(struct serdev_device *serdev)
>  probe_fail:
>  	reset_control_assert(nxpdev->pdn);
>  	hci_free_dev(hdev);
> -	return -ENODEV;
> +err_pwrseq_put:
> +	if (nxpdev->pwrseq)
> +		pwrseq_put(nxpdev->pwrseq);
> +	return err;
>  }
>  
>  static void nxp_serdev_remove(struct serdev_device *serdev)
> @@ -1952,6 +1976,8 @@ static void nxp_serdev_remove(struct serdev_device *serdev)
>  	ps_cleanup(nxpdev);
>  	hci_unregister_dev(hdev);
>  	reset_control_assert(nxpdev->pdn);
> +	if (nxpdev->pwrseq)
> +		pwrseq_put(nxpdev->pwrseq);
>  	hci_free_dev(hdev);
>  }
>  
> -- 
> 2.50.1
> 

-- 
மணிவண்ணன் சதாசிவம்

