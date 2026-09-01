Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE959C624CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 10:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tvCh+Pk/QSdhLUcm3AgIh7ynvqCmAYKr3CSFbG7Md98=; b=4xMJSw3dyQpnJNoneZOAg6zDZh
	Sh5PTquMyyVDL4Lg+EaZxDh4jmwYtdEXOp8EGm5CMjSqmXUlgSIIP5lsaM3e0EUYj95hSwNfvUxrO
	BOrxrjoizrk2bfLdebLyWyczQw/fQtJoG8K7e/QleuH/sZIo0MaIQLwrDTm7oUkpSQmDoxwxG0M3N
	ejgYJtJmUtyJwdYG7775QeNE463b8GjLieJy/pnLlCQ+6OIl0zjwBHsGJJnvwj/CPy+VbddSpCBKk
	w2I9NM9bUv3tSVDcYFNLQ0Sq+rl6+sOQwWEGLUW99sXQ9tG8Cz77lHp5TowbCMXf33I/uC24f3aSA
	JWqtFYsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1LIt-0000000BUTS-0cIJ;
	Tue, 01 Sep 2026 10:01:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1LIq-0000000BUSo-0UKY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 10:01:17 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA3FC1756;
	Tue,  1 Sep 2026 03:01:08 -0700 (PDT)
Received: from [10.57.5.169] (unknown [10.57.5.169])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 121CF3F882;
	Tue,  1 Sep 2026 03:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788256872; bh=hFaGbZs+gyNt53iDxI8FMGOZYwr8mY5moKC97lpcpIw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=EB7TCIJB8Iu53QCjpKXvPzdnpSErTVadChRzVVdQOExl+ee5c0IaDVVTERwoq/G16
	 qGKhHYRALZWWZJhTbY8uBYAJXMDVS7fswusR3VnuG5jgtgDTFP8NCsOddfA+6gNjOc
	 OSgwPTeZ9veykrDuDkiTZkRFc1GObf/MWmoiGwdw=
Message-ID: <92f25c89-4f9b-4880-95ee-8f1edb803692@arm.com>
Date: Tue, 1 Sep 2026 12:01:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 10/12] arm_mpam: add MPAM-Fb MSC firmware access
 support
To: Lee Trager <lee@trager.us>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, Ritwick Sharma <ritwick.sharma@arm.com>,
 Gavin Shan <gshan@redhat.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260807105451.3728284-1-andre.przywara@arm.com>
 <20260807105451.3728284-11-andre.przywara@arm.com>
 <948381d2-8ba7-458b-b729-d5398e0a8559@trager.us>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <948381d2-8ba7-458b-b729-d5398e0a8559@trager.us>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_030116_246756_285F8292 
X-CRM114-Status: GOOD (  16.28  )
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

Hi Lee,

On 9/1/26 00:19, Lee Trager wrote:
> On 8/7/26 3:54 AM, Andre Przywara wrote:
> 
>> +
>> +static int mpam_fb_send_request(struct mpam_msc *msc, u32 msc_id,
>> +                u16 reg, u32 *result, int mpam_fb_command)
>> +{
>> +    unsigned int token = atomic_inc_return(&mpam_fb_token);
>> +    struct acpi_pcct_ext_pcc_shared_memory __iomem *pcc_shmem;
>> +    struct mpam_pcc_chan *pcc_chan;
>> +    struct pcc_mbox_chan *chan;
>> +    void __iomem *payload_ofs;
>> +    int mpam_fb_err = 0;
>> +    u32 status;
>> +    int ret;
>> +
>> +    pcc_chan = msc->pcc_chan;
>> +    if (!pcc_chan)
>> +        return -ENODEV;
>> +
>> +    chan = pcc_chan->pcc_chan;
>> +
>> +    /* prune token to fit into the 10 bits inside the command 
>> register */
>> +    token = FIELD_GET(MPAM_MSC_TOKEN_MASK,
>> +              FIELD_PREP(MPAM_MSC_TOKEN_MASK, token));
>> +
>> +    mutex_lock(&pcc_chan->pcc_chan_lock);
>> +
>> +    switch (mpam_fb_command) {
>> +    case MPAM_PROTOCOL_VERSION_CMD:
>> +        mpam_fb_build_version_message(token, chan->shmem);
>> +        break;
>> +    case MPAM_MSC_READ_CMD:
>> +        mpam_fb_build_read_message(msc_id, reg, token, chan->shmem);
>> +        break;
>> +    case MPAM_MSC_WRITE_CMD:
>> +        mpam_fb_build_write_message(msc_id, reg, *result,
>> +                        token, chan->shmem);
>> +        break;
>> +    default:
>> +        dev_err(&msc->pdev->dev, "unsupported MPAM-Fb command %d\n",
>> +            mpam_fb_command);
>> +        ret = -EINVAL;
>> +        goto out_err;
>> +    }
>> +
>> +    ret = mbox_send_message(chan->mchan, NULL);
>> +    if (ret < 0)
>> +        goto out_err;
>> +
> While testing this series when building arm64 allnoconfig with 
> CONFIG_ARM4_MPAM=y I got a link failure:
> 
> drivers/resctrl/mpam_fb.o: undefined reference to `mbox_send_message`

Ah, thanks, that's a good find.

> Since the ACPI MPAM-Fb transport also reqiures PCC, wold it make sense 
> for ARM64_MPAM_DRIVER to select both dependencies?
> 
>      select MAILBOX
>      select PCC if ACPI

Yes, that looks like a pragmatic solution. Not sure if the MAILBOX 
should be selected so easily, as the other selects for that symbol seem 
to be more precise and constrained, and technically the mailbox is not 
required by the core functionality of MPAM. But I leave that to the 
maintainers to decide.

Cheers,
Andre


