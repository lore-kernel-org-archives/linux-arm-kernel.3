Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19E80CD6E4D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 13:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+sJaScVt81BsVeK4xjE7DaiDG3yNDCvrXVqWyVNiWD0=; b=CzNbH5CEIEQPpRA9OYelFaxYAK
	pm37gMdeB5bT9y4N4VRvxZp6dYi89rxaYGI+esJphLD324cB4wC/TYIw8gHFbKAxXiF1Op63/Ijgk
	UdcHpIitpCaqpIprfsX4VoyHmQeIsqgLmMsQbKEsxvhYUmuEr0P1GrdDq8zPs73t/+MQD0IsJWWm7
	/MdrHN5BSnwmSAOd9DW+rwuIJvhoob2ZONy4CvsFECqxWsYYOwEjd/8SWWttzC6pHWjwd3XnBN4DR
	us1CKbKK58IK7jos7nvFvRkJkK6rAKN+SpofSuOM6SLbrENOys8zJuuINgpYG2UN+beabMcdQy8LG
	6ADEaLgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWy0-0000000AVd9-3DF1;
	Thu, 13 Nov 2025 13:02:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWxw-0000000AVb9-2C87
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 13:02:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CF25844253;
	Thu, 13 Nov 2025 13:02:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1179FC116D0;
	Thu, 13 Nov 2025 13:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763038939;
	bh=/L06/z32jweN40cjaZPHRLCm3sG/QFbAOWPashtYEXs=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=fkoqBZsdd8Mnery3fINEDg/aDSvV+rd6JmptlBGmtzuEZbDl/VVzkuraqdLfzMPlI
	 Ckt6gKo1kCzCVbD9YRyR4nyn1Z6YIsFCeYekXXTg579swBpSJEAMIiwdKm0WvDeS/A
	 uNEoYFWSGbecbRH6i5mVRuLi5GFTVWsWcwRDXcTUy8CohjTnh0wxfXCFb8e4jMO+mV
	 MkGaQpdbuHMPp8IZutA7VJQl5nywaDHxMxVeADYna8RbzFNW6ZZIaVMwmQNTW1HI1C
	 fxq3rTNfko9GWEz7zPTmAY3Wwohbs4n519cQE5QFEgXN7redz3gl+FhN0/WVzVu3oc
	 kBJxGdn9h4nVw==
Content-Type: multipart/mixed; boundary="===============7781627510451298251=="
MIME-Version: 1.0
Message-Id: <c341189e76b2cf9bb2fe712c074bdd652f73edd5ea2f409655b2d78a62bd332f@mail.kernel.org>
In-Reply-To: <20251113123750.2507435-4-jolsa@kernel.org>
References: <20251113123750.2507435-4-jolsa@kernel.org>
Subject: Re: [PATCHv2 bpf-next 3/8] ftrace: Add update_ftrace_direct_add function
From: bot+bpf-ci@kernel.org
To: jolsa@kernel.org,rostedt@kernel.org,revest@google.com,mark.rutland@arm.com
Cc: bpf@vger.kernel.org,linux-kernel@vger.kernel.org,linux-trace-kernel@vger.kernel.org,linux-arm-kernel@lists.infradead.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,menglong8.dong@gmail.com,song@kernel.org,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Thu, 13 Nov 2025 13:02:18 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_050220_588904_7E4CC766 
X-CRM114-Status: GOOD (  10.84  )
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

--===============7781627510451298251==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> index e23e6a859..ded3a306a 100644
> --- a/include/linux/ftrace.h
> +++ b/include/linux/ftrace.h

[ ... ]

> @@ -568,6 +570,11 @@ static inline int modify_ftrace_direct_nolock(struct ftrace_ops *ops, unsigned l
>  	return -ENODEV;
>  }
>
> +int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
> +{
> +	return -ENODEV;
> +}
> +
>  /*
>   * This must be implemented by the architecture.
>   * It is the way the ftrace direct_ops helper, when called

Should this stub function have static inline qualifiers? All the other
stub functions in this section (ftrace_find_rec_direct,
register_ftrace_direct, unregister_ftrace_direct, modify_ftrace_direct,
and modify_ftrace_direct_nolock) use static inline. Without it, this
could cause multiple definition linker errors when the header is
included in multiple compilation units.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/19332026793

--===============7781627510451298251==--

