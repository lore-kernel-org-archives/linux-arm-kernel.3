Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637AA60A6F73
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 21:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sYzD2OyK;
	dkim=pass (2048-bit key, unprotected) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=h6Zhmgkl
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1KM15pS674xkwzoKzXbfoGMlVw+mkKvC51O5xmcBcQ4=; b=sYzD2OyKF1fC32CcguoGMR8XFj
	uftThlNSKjhtJ0IjfWEW42N3imJEf6KKSvQj3isCfYkpQlH3OKuIBugtfKwn97s1Zik2JYI1hKeDg
	O0+k4Qbv1oEAaQv6Re4DYJXZ0LeomQ9O6IPicTP28rWqZ9r0jRUQqwbr8YoBeJ1VWT03SSv924wYV
	zJg5oNZ7kIZTU/2sgx42qht58wITBFUU/jNe+u8sIO0P68GGqcLlC40skA1tB6TegPTfw8TQYbkjj
	PYMAGEIJdZHIr8tc/RlPfBKBIbSzotlrhzsr2e58/Dx8mgGEupnTKUu/St8CUp9Y/k6cT1D/4D4ku
	bBpUaQjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOixS-000000076In-0PEQ;
	Wed, 04 Nov 2026 21:55:50 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOixP-000000076Hm-0o0O
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 21:55:48 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jKfQ45tJbzKmTr;
	Wed, 04 Nov 2026 22:55:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1793829340;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1KM15pS674xkwzoKzXbfoGMlVw+mkKvC51O5xmcBcQ4=;
	b=h6ZhmgklkVRwYt1n9X/n8y/F+89/7eFCzwSd2uXk55wsQ90Ro6crnRQRb1W+/3wBdTgGDs
	rCgkbMrz+lPdFeq24VLUNk86fQWkG/Qmp6KRJki29gFw+aDzt0BI8/eGO4DfWF53mgQ00F
	Vvtx/YuT8JfVPVJ335jZeVFTJMhxMS42kLvwZcgTlLMKk0LyIdGepefjq/dY3M4DDG5hHI
	ls+7WPGd5m0yNMYTHmVUO2Wherq54OuGJFTmtAuOPtrmGN2wy+kpaCmxF3cjZ8PU9+jfvm
	S2Z82043mZWjhHxFE2StoOuBkYEgjH39Nnh2b8Y0RWgBlymNfCmoHckwWGJ6/g==
Date: Wed, 4 Nov 2026 22:55:35 +0100
From: Anthony Ruhier <aruhier@mailbox.org>
To: Pragnesh Papaniya <pragnesh.papaniya@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>, 
	Pankaj Patil <pankaj.patil@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Amir Vajid <amir.vajid@oss.qualcomm.com>, 
	Ramakrishna Gottimukkula <ramakrishna.gottimukkula@oss.qualcomm.com>
Subject: Re: [PATCH RFC 07/10] PM / devfreq: Introduce the QCOM SCMI Memlat
 devfreq driver
Message-ID: <auukrIsbbd3q-qh-@tour-anthony.aruhier.fr>
References: <20260724-rfc_v8_scmi_memlat-v1-0-cb732bcff1f4@oss.qualcomm.com>
 <20260724-rfc_v8_scmi_memlat-v1-7-cb732bcff1f4@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-rfc_v8_scmi_memlat-v1-7-cb732bcff1f4@oss.qualcomm.com>
X-MBO-RS-ID: bdc02223a3e50c9f112
X-MBO-RS-META: 5mbzo6rkf8d9aucpqd6mxur6iz7r7xd3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_135547_372431_1363236A 
X-CRM114-Status: GOOD (  19.03  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On Fri, Jul 24, 2026 at 12:48:12PM +0530, Pragnesh Papaniya wrote:
> From: Sibi Sankar <sibi.sankar@oss.qualcomm.com>
> +	for (i = 0; i < info->memory_cnt; i++) {
> +		struct scmi_qcom_memory_info *memory = info->memory[i];
> +		const struct scmi_qcom_memory_range *range = &memory->cfg->memory_range;
> +		struct devfreq_dev_profile *profile = &memory->profile;
> +
> +		/*
> +		 * CPUCP re-evaluates and re-votes at most once per cpucp_sample_ms,
> +		 * so a new operating point can appear only that often. Polling at half
> +		 * that period guarantees each distinct vote is observed in trans_stat
> +		 * before it can change again.
> +		 */
> +		profile->polling_ms = max(1U, info->cfg_data->cpucp_sample_ms / 2);
> +		profile->get_cur_freq = scmi_qcom_devfreq_get_cur_freq;
> +		profile->initial_freq = range->max_freq_khz > 1 ?
> +					(unsigned long)((u64)range->min_freq_khz * HZ_PER_KHZ) :
> +					range->min_freq_khz;
> +
> +		faux_device_set_drvdata(memory->fdev, memory);
> +
> +		memory->devfreq = devfreq_add_device(&memory->fdev->dev, profile,
> +						     DEVFREQ_GOV_REMOTE, NULL);
> +		if (IS_ERR(memory->devfreq)) {
> +			ret = PTR_ERR(memory->devfreq);
> +			memory->devfreq = NULL;
> +			ops->stop_activity(ph, NULL, 0, MEMLAT_ALGO_STR, MEMLAT_STOP_TIMER);
> +			return dev_err_probe(&sdev->dev, ret, "failed to add devfreq device\n");
> +		}
> +	}

I tried it on Hamoa (Yoga Slim 7x, x1e80100), loaded scmi_qcom_memlat_devfreq,
and I see the apss_cpucp_mbox IRQ firing 3100 times per second. It raised the
power consumption while idle, screen off, from 0.9W to 1.4W.

The polling seems to be the issue, as I didn't see hectic changes of frequency.
Raising the polling from 2ms (default) to 20ms makes the power usage goes back
to around 0.95W, with ~150 interrupts/s from apss_cpucp_mbox. It's still higher
than with memlat off, but it seems to be a better trade-off for now.

Can you check on similar platforms (hamoa, glymor) if you see the same issue?

Thanks,
--
Anthony Ruhier

