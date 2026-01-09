Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9A6D167FC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 10:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=gcJSrHHAs4btfyEkLL3B+WgOB0wSeax6et87+OSmzT4=; b=e5+jc4tjFaicnjLy89U8i59BUK
	AaTyeLuiIdem+0Er3wkwJa1oqs9MIUlI9XHLbOlmjRwzgWsIlQPqBy7EH0WohTFumv550ic5dMyM6
	0wqDcyH5rNv78j9HrTp3/amSAn5bG8QOZkhPCzAhXYQQAXxouu8t7cdByxlpws+re1KpDucU+oZ03
	E0hpSApuD8dVk/rU9wNU0HUASRS+Q2KPgLcoOw2kJnFdLjoR24ngOQAYIl+mTAacXjVXwwzeOXY4C
	sGtSCMiVSXVy07Q237j4IojEc1PdHKp5mJ/xuPCdO0dRQ4YlTCzw0LR2iH9DZ6PdVYUYcDGABgLg8
	vuHNJxDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9fi-000000028CM-3SUI;
	Fri, 09 Jan 2026 10:24:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve9fg-000000028B6-013W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 10:24:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4390F40693;
	Fri,  9 Jan 2026 10:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9303AC16AAE;
	Fri,  9 Jan 2026 10:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767954283;
	bh=QLg70m52S+BZ/YlLw0GoYosME7rDVF1RLDHJ1MV2EEk=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=fX+mz7wtbjB3i84dupJqpxXg2rV7lDi4uFgnS17LKsgvqc4EbZlue27OJoVFz4obP
	 SvnuBeBtYa7cH5H0pNpeq/cIIRvcwt5bqfS6CFEiFgJR6ui+nO/PrZ/Gtp9/nvnCLA
	 h2OcFpqds/O0zGiRVk0Oo2UJr+dPKdUbHGx4DmRg=
Subject: Patch "pwm: stm32: Always program polarity" has been added to the 6.12-stable tree
To: alexandre.torgue@foss.st.com,fabrice.gasnier@foss.st.com,linux-arm-kernel@lists.infradead.org,linux-stm32@st-md-mailman.stormreply.com,mcoquelin.stm32@gmail.com,sean@geanix.com,u.kleine-koenig@baylibre.com,ukleinek@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Fri, 09 Jan 2026 11:24:40 +0100
In-Reply-To: <20260108-stm32-pwm-v2-1-ced582974f8b@geanix.com>
Message-ID: <2026010940-skewed-curable-c81f@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_022444_069217_8C521CEF 
X-CRM114-Status: GOOD (  12.78  )
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


This is a note to let you know that I've just added the patch titled

    pwm: stm32: Always program polarity

to the 6.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     pwm-stm32-always-program-polarity.patch
and it can be found in the queue-6.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From sean@geanix.com  Fri Jan  9 11:22:32 2026
From: Sean Nyekjaer <sean@geanix.com>
Date: Thu, 08 Jan 2026 13:45:23 +0100
Subject: pwm: stm32: Always program polarity
To: "Fabrice Gasnier" <fabrice.gasnier@foss.st.com>, "Uwe Kleine-König" <ukleinek@kernel.org>, "Maxime Coquelin" <mcoquelin.stm32@gmail.com>, "Alexandre Torgue" <alexandre.torgue@foss.st.com>
Cc: "Uwe Kleine-König" <u.kleine-koenig@baylibre.com>, linux-pwm@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, "Sean Nyekjaer" <sean@geanix.com>
Message-ID: <20260108-stm32-pwm-v2-1-ced582974f8b@geanix.com>

From: Sean Nyekjaer <sean@geanix.com>

Commit 7346e7a058a2 ("pwm: stm32: Always do lazy disabling") triggered a
regression where PWM polarity changes could be ignored.

stm32_pwm_set_polarity() was skipped due to a mismatch between the
cached pwm->state.polarity and the actual hardware state, leaving the
hardware polarity unchanged.

Fixes: 7edf7369205b ("pwm: Add driver for STM32 plaftorm")
Cc: stable@vger.kernel.org # <= 6.12
Signed-off-by: Sean Nyekjaer <sean@geanix.com>
Co-developed-by: Uwe Kleine-König <ukleinek@kernel.org>
Signed-off-by: Uwe Kleine-König <ukleinek@kernel.org>
---
 drivers/pwm/pwm-stm32.c |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- a/drivers/pwm/pwm-stm32.c
+++ b/drivers/pwm/pwm-stm32.c
@@ -458,8 +458,7 @@ static int stm32_pwm_apply(struct pwm_ch
 		return 0;
 	}
 
-	if (state->polarity != pwm->state.polarity)
-		stm32_pwm_set_polarity(priv, pwm->hwpwm, state->polarity);
+	stm32_pwm_set_polarity(priv, pwm->hwpwm, state->polarity);
 
 	ret = stm32_pwm_config(priv, pwm->hwpwm,
 			       state->duty_cycle, state->period);


Patches currently in stable-queue which might be from sean@geanix.com are

queue-6.12/pwm-stm32-always-program-polarity.patch

