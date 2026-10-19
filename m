Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513CBCCF2D6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 09:48:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kxYpOKeNE1GtVJhZEKyHa5DQN9VTfVaw7R5GeyyShr8=; b=mjCV6la2Xdsi8UwH9UKyAOtWzz
	DFV24CFYkHcjrInSIVtTYEKLEucejwWSBzId01GrVVTyzx4xX1dcHsn3pJ5m4RkOeAptoxW6rPeMM
	E/T8GP+hL7wC16d0f5TqVVWWB1+2AnL/kmd5pCR+tP84GjzR+rzl3/lysvwj9cb1m2BLDkMt6khvA
	hnLP8Ry+Dqv/2G9L7P9IVZL7z7uwAtK15cTU2fGILLsxO2PrjEPgqhRtVZ8XlBws8q5cNPfKYNil7
	E8aKZgxYwtrYMu/vYmPHQAfrPORooORjjZWMpq1HgDXwVWm31ry9WppPn4Et6TkpUdNAKkCtgwr7o
	JmQJHbPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjz3-000000073gq-0P1d;
	Mon, 19 Oct 2026 09:48:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIjz1-000000073gj-39xK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 09:48:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2A41A407D5;
	Mon, 19 Oct 2026 09:48:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD83F1F000C4;
	Mon, 19 Oct 2026 09:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792403323;
	bh=kxYpOKeNE1GtVJhZEKyHa5DQN9VTfVaw7R5GeyyShr8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kUVqNXuhw67wpa517IY0Ef+gOzCTXJ9z1qfR4Gv4/xhOdzusCmOvJA82ZVuskQbq6
	 a8z2NHGfBT2msPVz1fYsqVrThrWLS2M+za1Au2Rn0bVNv4bXdoshiw2oB+2LTq1dYd
	 bsU55W/HjQdKjERA/34g/zOUFrvZsN8NRKs0w0dtkuGtOLEKcB7ozGIHz8abA2YIMg
	 /g/bsloLYWA9WdusRAOlKTL3GKa1JknAnfkp7THoN16OAGbgOpJg4NlM27baLp3Czc
	 fydllsmnjtJqd6p3Sq4geid0d7rpA0T/IUhbpQiA5uYJ+Aoe/5K466zpyDt4qGZYTt
	 mxT7ECqLVpkpQ==
Date: Mon, 19 Oct 2026 11:48:39 +0200
From: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
To: Myeonghun Pak <mhun512@gmail.com>
Cc: Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, 
	linux-kernel@vger.kernel.org, soc@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH] platform: cznic: turris-omnia-mcu: stop button emulation
 producers
Message-ID: <atXYWrNAI5pmyMHD@solitude>
References: <20261016013918.3492835-1-mhun512@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261016013918.3492835-1-mhun512@gmail.com>
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

Acked-by: Marek Behún <kabel@kernel.org>

This makes sense.

But I wonder whether the devm_delayed_work_drop() from devm-helpers.h
should not be changed to use disable_delayed_work_sync() instead of
cancel_delayed_work_sync().

In this case the initialization function in devm-helpers should be called
devm_delayed_work_autodisable() instead of devm_delayed_work_autocancel(),
though.

On Thu, Oct 15, 2026 at 09:39:18PM -0400, Myeonghun Pak wrote:
> The legacy MCU IRQ thread can requeue button-release emulation work
> after its managed cleanup has canceled it. Since the IRQ is still active
> at that point, the newly queued work can outlive device teardown and
> access freed MCU state.
> 
> Use disable_delayed_work_sync() to prevent further queueing and drain
> the worker before the IRQ action is released. Keep the parent IRQ active
> while the worker completes. devm_add_action_or_reset() also drains the
> work if action registration fails.
> 
> This issue was identified as part of our ongoing research while
> reviewing kernel code.
> 
> Fixes: dfa556e45ae9 ("platform: cznic: turris-omnia-mcu: Add support for MCU connected GPIOs")
> Assisted-by: LLM
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
>  .../platform/cznic/turris-omnia-mcu-gpio.c    | 31 +++++++++----------
>  1 file changed, 15 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/platform/cznic/turris-omnia-mcu-gpio.c b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
> index 4e430d6c3fc4..8f43bfa92373 100644
> --- a/drivers/platform/cznic/turris-omnia-mcu-gpio.c
> +++ b/drivers/platform/cznic/turris-omnia-mcu-gpio.c
> @@ -11,7 +11,6 @@
>  #include <linux/bug.h>
>  #include <linux/cleanup.h>
>  #include <linux/device.h>
> -#include <linux/devm-helpers.h>
>  #include <linux/errno.h>
>  #include <linux/gpio/consumer.h>
>  #include <linux/gpio/driver.h>
> @@ -841,6 +840,18 @@ static void button_release_emul_fn(struct work_struct *work)
>  	generic_handle_irq_safe(mcu->client->irq);
>  }
>  
> +static void omnia_disable_button_release_work(void *data)
> +{
> +	struct delayed_work *work = data;
> +
> +	/*
> +	 * The IRQ thread may requeue this work while the IRQ remains active.
> +	 * Disable and drain it before releasing the IRQ action and the MCU
> +	 * state used by the worker.
> +	 */
> +	disable_delayed_work_sync(work);
> +}
> +
>  static void
>  fill_int_from_sts(unsigned long *rising, unsigned long *falling,
>  		  unsigned long rising_sts, unsigned long falling_sts,
> @@ -1082,21 +1093,9 @@ int omnia_mcu_register_gpiochip(struct omnia_mcu *mcu)
>  		return dev_err_probe(dev, err, "Cannot request IRQ\n");
>  
>  	if (!new_api) {
> -		/*
> -		 * The button_release_emul_work has to be initialized before the
> -		 * thread is requested, and on driver remove it needs to be
> -		 * canceled before the thread is freed. Therefore we can't use
> -		 * devm_delayed_work_autocancel() directly, because the order
> -		 *   devm_delayed_work_autocancel();
> -		 *   devm_request_threaded_irq();
> -		 * would cause improper release order:
> -		 *   free_irq();
> -		 *   cancel_delayed_work_sync();
> -		 * Instead we first initialize the work above, and only now
> -		 * after IRQ is requested we add the work devm action.
> -		 */
> -		err = devm_add_action(dev, devm_delayed_work_drop,
> -				      &mcu->button_release_emul_work);
> +		err = devm_add_action_or_reset(dev,
> +					       omnia_disable_button_release_work,
> +					       &mcu->button_release_emul_work);
>  		if (err)
>  			return err;
>  	}

