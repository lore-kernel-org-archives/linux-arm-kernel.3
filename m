Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46D5D2F7CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 10:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dHsaB0za6SaBtBWJ+VqZlLJN437Gmo2MXhly0MpdTC4=; b=Ek/b/pkzqg7COvRgjmCD3AvhlU
	LEDNn43B/9zTBk5mzdrivZUijphhgqjAaKvX+YbqlgY5lkCu6e6X69Ww8cZJdJANuB7jJjLl5shFZ
	JLhDJ150lq+z9MJAZZlnUTGsw9sai5iZf1UpcgFDSD72LbWdTp9Pm+9RWsnuLlP8ZmUkDo0ihpnpX
	Y5nWjXzgQyCGBTX6gSjA9yHjLgpk+J+gD9F7fAVJ70qqOPuMJkLvcGB+q5lBxAIKNJjt3XK5bq8O5
	iumZmi8c/qhD1JwxqNYTA1LTBT8R8pvpX8t8ANKWrcikFtRhDXvIu5jNnPRcZXlld3P7DJpUrNix4
	WqC68YAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSg5-00000009MYF-0Jgm;
	Fri, 05 Dec 2025 10:04:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRSg2-00000009MXA-25d2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 10:04:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F544339;
	Fri,  5 Dec 2025 02:04:27 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8E6E73F86F;
	Fri,  5 Dec 2025 02:04:34 -0800 (PST)
Date: Fri, 5 Dec 2025 10:04:32 +0000
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>
Cc: Yingchao Deng <yingchao.deng@oss.qualcomm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
	quic_yingdeng@quicinc.com, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
	Mao Jinlong <quic_jinlmao@quicinc.com>
Subject: Re: [PATCH v6 2/2] coresight: cti: Add Qualcomm extended CTI support
Message-ID: <20251205100432.GO724103@e132581.arm.com>
References: <20251202-extended_cti-v6-0-ab68bb15c4f5@oss.qualcomm.com>
 <20251202-extended_cti-v6-2-ab68bb15c4f5@oss.qualcomm.com>
 <20251203182944.GG724103@e132581.arm.com>
 <CAJ9a7VjWDBEwdmMf53geACBWGusC8BC3pJuOLETeecw24+N35Q@mail.gmail.com>
 <20251204103151.GK724103@e132581.arm.com>
 <CAJ9a7VjHHkkTz9XJqjdQ+11_XX9zXuY0ZcQzPtq=Zvi4CN__0A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ9a7VjHHkkTz9XJqjdQ+11_XX9zXuY0ZcQzPtq=Zvi4CN__0A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_020438_573444_FC8C1855 
X-CRM114-Status: GOOD (  19.56  )
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

Hi Mike,

On Thu, Dec 04, 2025 at 04:17:35PM +0000, Mike Leach wrote:

[...]

> The tables in the patch are
> 
>     [reg_type_array_index] = offset_address;
> 
> e.g.
> 
>   [INDEX_CTIINTACK]  = QCOM_CTIINTACK
> 
> which resolves to
> 
>  [1] = 0x020
> 
> where index is constant for a given register type,
> 
> As far as I can tell what you have suggested above is a table that is
> 
>   [std_addr_offset] = qcom_addr_offset;
> 
> e.g.
> 
> [CTIINTACK]             = QCOM_CTIINTACK,
> 
> which resolves to
> 
> [0x10]  = 0x020
> 
> which does not appear to work correctly?
> 
> The registers are sparsely spread across the memory map, so a simple
> mapping does not work, even if we divide the original offset by 4 to
> create a register number.

This should work.  Though the array is not filled for each item, but
it will return back 0x20 when we access array[0x10], I don't see
problem here.

> The largest standard offset we have is ITTRIGIN = 0xEF8, so assuming
> the compiler allows us to sparselly populate the array (which I think
> it does, along with some padding), we end up with an array of at least
> 0xEF8 elements, rather then the indexed 21?

I tested locally and did not see the GCC complaint for this approach.
And this is a global structure with about 16KiB (~4K items x
sizeof(u32)), we don't need to worry about scaling issue as it is
shared by device instances.

If you dislike this way, then a static function also can fulfill the
same task, something like:

    static noinline u32 cti_qcom_reg_off(u32 offset)
    {
            switch (offset) {
            CTIINTACK: return QCOM_CTIINTACK;
            CTIAPPSET: return QCOM_CTIAPPSET;
            ...
            default:
                WARN(1, "Unknown offset=%u\n", offset);
                return 0;
            }

            /* Should not run here, just for compiling */
	    return 0;
    }

Thanks,
Leo

