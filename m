Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 145A3CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 13:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y49yKLCcUdOoPfuJLpPT3hWr1AHwnP3o2LT5mHHv2+o=; b=EnmqJiYXubVQMRhI81qKCrH04+
	S0ZpQmU0+6LIFyopNvnBulSTZTv5qnRDDhHdBvwVZlZrz+3ADAEPTGC6tYuiKVoadiFjEf4wUd9Bm
	I8P5HtYPUgBydLm+PUIINxIAZ51STsu/yUdcAsrN9K9UmusPSAlHCZ8fz4MDy6wemJsWyRMjJJo09
	yPI5l3gp1cq0MnnLjICQYgdcOX2aFDZuVONt3mUjKgUrC+wJdNPkuBd7xs+rnk2FjlqRh3kYEVsI1
	DaY82kSaP4oJcZxPdQXnS8PpU05WN/3h/GdM+SRGLwT9wjOXkxdFUXJnHfH2DctNvqu0XZBPxmLt5
	dpuIZ0yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDsd-000000048zF-13dY;
	Wed, 27 May 2026 13:01:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDsa-000000048y3-1qH1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 13:01:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 30CBC442C8;
	Wed, 27 May 2026 13:00:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B04E1F000E9;
	Wed, 27 May 2026 13:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779886859;
	bh=Y49yKLCcUdOoPfuJLpPT3hWr1AHwnP3o2LT5mHHv2+o=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=iUUlIxD5zKEkXPE9ZMfaoUy+x4nykjkWV7nZM1MFpvc+pMmlTn4fcZJWfETdYNttm
	 IGyd340RlAqTs2vyhTDP0SnHMcaY/hSCbcmwJ1EgAUB3Nvik6yP6cBQh/gDsyEEgp0
	 +jGTWZt99xk32pDMY0RXW3sL4EjqYdxFsPmsl0CucgM5QdCkBIZLw7XL60bNdRmLdR
	 bAEZ1FZlLB00aHNwznFc5CS0sunq8xOvAh5OC8hmOSYbN97g1bjp76iJsMZVUY9Ejl
	 yTZaBEnxXPztXhEWuFgE3U0KdzNMtaPh1qannEzAZ2xWDmPfhWLjH5DppNZJtPdO6G
	 lQNO2vNASlkNg==
Content-Type: multipart/mixed; boundary="===============4572472540278009869=="
MIME-Version: 1.0
Message-Id: <c76146b9af70845f55114d28e59d8a94a15e9365aecc7f28d42f08b157f10065@mail.kernel.org>
In-Reply-To: <20260527121207.2312181-3-puranjay@kernel.org>
References: <20260527121207.2312181-3-puranjay@kernel.org>
Subject: Re: [PATCH v4 2/4] perf: Use a union to clear branch entry bitfields
From: bot+bpf-ci@kernel.org
To: puranjay@kernel.org,bpf@vger.kernel.org
Cc: puranjay@kernel.org,puranjay12@gmail.com,ast@kernel.org,daniel@iogearbox.net,john.fastabend@gmail.com,andrii@kernel.org,martin.lau@linux.dev,eddyz87@gmail.com,song@kernel.org,yonghong.song@linux.dev,will@kernel.org,mark.rutland@arm.com,catalin.marinas@arm.com,leo.yan@arm.com,robh@kernel.org,peterz@infradead.org,mingo@redhat.com,acme@kernel.org,namhyung@kernel.org,james.clark@linaro.org,irogers@google.com,adrian.hunter@intel.com,shuah@kernel.org,leitao@debian.org,ravi.bangoria@amd.com,eranian@google.com,memxor@gmail.com,usama.arif@linux.dev,linux-arm-kernel@lists.infradead.org,linux-perf-users@vger.kernel.org,linux-kselftest@vger.kernel.org,linux-kernel@vger.kernel.org,kernel-team@meta.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Wed, 27 May 2026 13:00:58 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_060100_519577_207C0C1C 
X-CRM114-Status: GOOD (  20.11  )
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

--===============4572472540278009869==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

>     perf: Use a union to clear branch entry bitfields
>
>     perf_clear_branch_entry_bitfields() zeroes individual bitfields of struct
>     perf_branch_entry but has repeatedly fallen out of sync when new fields
>     were added (new_type and priv were missed).
>
>     Wrap the bitfields in an anonymous struct inside a union with a u64
>     bitfields member, and clear them all with a single assignment. This
>     avoids having to update the clearing function every time a new bitfield
>     is added.
>
>     Fixes: bfe4daf850f4 ("perf/core: Add perf_clear_branch_entry_bitfields() helper")
>     Signed-off-by: Puranjay Mohan <puranjay@kernel.org>

The Fixes tag points to commit bfe4daf850f4 which introduced the
perf_clear_branch_entry_bitfields() helper, but that commit was correct
at the time.

The actual bug was introduced by commit b190bc4ac9e6 which added the
'new_type' field without updating the clearing function. Commit
5402d25aa571 also added the 'priv' field with the same issue.

Should the Fixes tag be:

  Fixes: b190bc4ac9e6 ("perf: Extend branch type classification")

> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index 48d851fbd8ea..f7360c43f902 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -1474,14 +1474,7 @@ static inline u32 perf_sample_data_size(struct perf_sample_data *data,
>   */
>  static inline void perf_clear_branch_entry_bitfields(struct perf_branch_entry *br)
>  {
> -	br->mispred	= 0;
> -	br->predicted	= 0;
> -	br->in_tx	= 0;
> -	br->abort	= 0;
> -	br->cycles	= 0;
> -	br->type	= 0;
> -	br->spec	= PERF_BR_SPEC_NA;
> -	br->reserved	= 0;
> +	br->bitfields = 0;
>  }
>
>  extern void perf_output_sample(struct perf_output_handle *handle,
> diff --git a/include/uapi/linux/perf_event.h b/include/uapi/linux/perf_event.h
> index fd10aa8d697f..c2e7b1b1c4fa 100644
> --- a/include/uapi/linux/perf_event.h
> +++ b/include/uapi/linux/perf_event.h
> @@ -1491,16 +1491,21 @@ union perf_mem_data_src {
>  struct perf_branch_entry {
>  	__u64	from;
>  	__u64	to;
> -	__u64	mispred   :  1, /* target mispredicted */
> -		predicted :  1, /* target predicted */
> -		in_tx     :  1, /* in transaction */
> -		abort     :  1, /* transaction abort */
> -		cycles    : 16, /* cycle count to last branch */
> -		type      :  4, /* branch type */
> -		spec      :  2, /* branch speculation info */
> -		new_type  :  4, /* additional branch type */
> -		priv      :  3, /* privilege level */
> -		reserved  : 31;
> +	union {
> +		struct {
> +			__u64	mispred   :  1, /* target mispredicted */
> +				predicted :  1, /* target predicted */
> +				in_tx     :  1, /* in transaction */
> +				abort     :  1, /* transaction abort */
> +				cycles    : 16, /* cycle count to last branch */
> +				type      :  4, /* branch type */
> +				spec      :  2, /* branch speculation info */
> +				new_type  :  4, /* additional branch type */
> +				priv      :  3, /* privilege level */
> +				reserved  : 31;
> +		};
> +		__u64	bitfields;
> +	};
>  };
>
>  /* Size of used info bits in struct perf_branch_entry */
> diff --git a/tools/include/uapi/linux/perf_event.h b/tools/include/uapi/linux/perf_event.h
> index fd10aa8d697f..c2e7b1b1c4fa 100644
> --- a/tools/include/uapi/linux/perf_event.h
> +++ b/tools/include/uapi/linux/perf_event.h
> @@ -1491,16 +1491,21 @@ union perf_mem_data_src {
>  struct perf_branch_entry {
>  	__u64	from;
>  	__u64	to;
> -	__u64	mispred   :  1, /* target mispredicted */
> -		predicted :  1, /* target predicted */
> -		in_tx     :  1, /* in transaction */
> -		abort     :  1, /* transaction abort */
> -		cycles    : 16, /* cycle count to last branch */
> -		type      :  4, /* branch type */
> -		spec      :  2, /* branch speculation info */
> -		new_type  :  4, /* additional branch type */
> -		priv      :  3, /* privilege level */
> -		reserved  : 31;
> +	union {
> +		struct {
> +			__u64	mispred   :  1, /* target mispredicted */
> +				predicted :  1, /* target predicted */
> +				in_tx     :  1, /* in transaction */
> +				abort     :  1, /* transaction abort */
> +				cycles    : 16, /* cycle count to last branch */
> +				type      :  4, /* branch type */
> +				spec      :  2, /* branch speculation info */
> +				new_type  :  4, /* additional branch type */
> +				priv      :  3, /* privilege level */
> +				reserved  : 31;
> +		};
> +		__u64	bitfields;
> +	};
>  };
>
>  /* Size of used info bits in struct perf_branch_entry */

---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/26510917353
--===============4572472540278009869==--

