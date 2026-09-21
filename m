Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6358BC982E6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 16:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PyHmy8r/O5EX/bAIT+ss5mh6M+tcDcvG0zSQ88r4hQM=; b=dOCAtXC2s7Up05dcNVpWcPCkv/
	oHmhlI526FSn3hveLL87Nc/wPHzX/Md80lx3s876+uepp6PzgoWbu8vSPPCMt87/WQHt4suKoj2At
	6WLqRJiQZxIPZmas0VuTYt5qYOcTQHwUPZrD15CDunnbKnqlt5crJ/EQ3smjGuslbN1MTQ0LkKSGF
	c22GCSE5V8KF5UTg7R390fOHVm2q2J0brNrBppJjMbtbGSi/qnlTjF4dakU78cd6Otq/88kssk4iJ
	2Lgt18xjwyYf2XsB/3Wh/KpWcF/z7oBp9FXIGNP5TIsiYuVo6QSBOTwR8ubxp2K7asyelsAnZYr4B
	nICS01ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gZr-00000002mTZ-3cGR;
	Mon, 21 Sep 2026 16:09:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8gZr-00000002mTH-0TQC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 16:09:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4CDCA60142;
	Mon, 21 Sep 2026 16:09:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 717A51F000FF;
	Mon, 21 Sep 2026 16:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790006950;
	bh=PyHmy8r/O5EX/bAIT+ss5mh6M+tcDcvG0zSQ88r4hQM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=RmrzuHvYZqJIsUvy0vk/EifYiIphyntnEsNvTkBvL32cJTv2+88OaBhoqzXUSEKqX
	 50t3XHwV7ptdlhNrCrV031N+NV8JyBnH9y2GphFXHlbgJOYKMBnCdMl0RQC5RpDeuG
	 iKyc1EMcUlt8K76Na6RURxTKJvIu4J+QeSXJ2L1Loa5Lq66FNoG+wOnDfd4+AKhUmY
	 e/RV7KLSOHPoaAjctJ3MdvWEF0exj1YmVPj4lvpzh5vHirYvz/cymSoRYDbnC5Ub2v
	 vfjGKOqtZHRCTwToJGgGn3d4g/MFdJ77eMdBohC2aH7VkxjjZDPegiRZuY9mei7FB8
	 xAsyfIq9di2hw==
Date: Mon, 21 Sep 2026 17:09:05 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v4 6/8] firmware: smccc: lfa: Register DT interrupt
Message-ID: <20260921-aloof-sympathetic-python-54aa7d@sudeepholla>
References: <20260918141112.2115555-1-andre.przywara@arm.com>
 <20260918141112.2115555-7-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260918141112.2115555-7-andre.przywara@arm.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, Salman Nabi <salman.nabi@arm.com>, Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>, Sudeep Holla <sudeep.holla@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, vsethi@nvidia.com, Nirmoy Das <nirmoyd@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Sep 18, 2026 at 04:11:09PM +0200, Andre Przywara wrote:
> The Arm Live Firmware Activation spec describes an asynchronous
> notification mechanism, where the platform can notify the host OS about
> newly pending image updates.
> In the absence of the ACPI notification mechanism also a simple
> devicetree node can describe an interrupt.
> 
> Add code to find the respective DT node and register the specified
> interrupt, to trigger the activation if needed.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/firmware/smccc/lfa_fw.c | 39 +++++++++++++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
> 
> diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
> index 7a55b4a6785d8..a23df331ffde9 100644
> --- a/drivers/firmware/smccc/lfa_fw.c
> +++ b/drivers/firmware/smccc/lfa_fw.c
> @@ -16,6 +16,8 @@
>  #include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/nmi.h>
> +#include <linux/of.h>
> +#include <linux/of_irq.h>
>  #include <linux/psci.h>
>  #include <linux/stop_machine.h>
>  #include <linux/string.h>
> @@ -871,6 +873,37 @@ static void lfa_remove_acpi(struct device *dev)
>  }
>  #endif
>  
> +static irqreturn_t lfa_irq_handler_thread(int irq, void *dev_id)
> +{
> +	int ret;
> +
> +	while (!(ret = activate_pending_image()))
> +		;

Yet again trusting firmware too much!

> +
> +	if (ret != -ENOENT)
> +		pr_warn("notified image activation failed: %d\n", ret);
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int lfa_register_dt(struct device *dev)
> +{
> +	struct device_node *np;
> +	unsigned int irq;
> +
> +	np = of_find_compatible_node(NULL, NULL, "arm,lfa");
> +	if (!np)
> +		return -ENODEV;
> +
> +	irq = irq_of_parse_and_map(np, 0);
> +	of_node_put(np);
> +	if (!irq)
> +		return -ENODEV;
> +
> +	return devm_request_threaded_irq(dev, irq, NULL, lfa_irq_handler_thread,
> +					 IRQF_COND_ONESHOT, NULL, NULL);

And where can I find free_irq() ? Yes devm_() can do that for you but how
does that work with races around removal of device for example. I prefer
to have free_irq() at the very beginning of lfa_remove().

> +}
> +
>  static int lfa_smccc_probe(struct arm_smccc_device *sdev)
>  {
>  	struct arm_smccc_1_2_regs reg = { 0 };
> @@ -913,6 +946,12 @@ static int lfa_smccc_probe(struct arm_smccc_device *sdev)
>  			pr_info("registered LFA ACPI notification\n");
>  		if (err != -ENODEV)
>  			return err;
> +	} else {
> +		err = lfa_register_dt(&sdev->dev);
> +		if (!err)
> +			pr_info("registered LFA DT notification interrupt\n");
> +		if (err != -ENODEV)
> +			return err;

More code addition with absolutely no error handling 🙁.


>  	}
>  
>  	return 0;
> -- 
> 2.43.0
> 

-- 
Regards,
Sudeep

