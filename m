Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C40ED10F5D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 15:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rE3eAqI81XhNX4ZTRlXnqK0bOPZK9J0zxG3ZNekh/N0=; b=XoBVEKx8X/yCZXdAyRMHD6u6Bd
	kmiAUJ31hY0AHIZYWvVVUcjtdWuYiYP3koRPQrOYlmasLaeYt+zQ5fkOjxdBLYege6IUuW7SJ0aQe
	rDVmtS1uzAns+L5Rpv557lYhrJlYStRzRrStWEB+AALgXITLT0mP0QzlfESHP2xQQoe1y7I67UZ/f
	adlAFXJCCv2lHMMmw1WS2PjZOJMDqQtkLEc58ZFOd0PRHZaWqgw0lKpVlM3NBsW9gfy9rgqvqeqyt
	/gW9y6eLDE6vg3kmd9alRm0yEtzA2JjXMC8eJBYB1tr0bFK510G1wSJzubCdVglXEBkGkOGryH3um
	4Don6seA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHEM-0000000FAUa-2Tmf;
	Wed, 26 Nov 2025 15:14:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOHEK-0000000FATh-27GO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 15:14:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 535A7168F;
	Wed, 26 Nov 2025 07:14:43 -0800 (PST)
Received: from localhost (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 626683F66E;
	Wed, 26 Nov 2025 07:14:50 -0800 (PST)
Date: Wed, 26 Nov 2025 15:14:48 +0000
From: Leo Yan <leo.yan@arm.com>
To: Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 13/13] coresight: docs: Document etm4x timestamp
 interval option
Message-ID: <20251126151448.GM724103@e132581.arm.com>
References: <20251126-james-cs-syncfreq-v7-0-7fae5e0e5e16@linaro.org>
 <20251126-james-cs-syncfreq-v7-13-7fae5e0e5e16@linaro.org>
 <20251126140154.GK724103@e132581.arm.com>
 <CAJ9a7VgcAiw_h=OTxOK0Vcv=9WFCbdb-+RzDKYhigZZhepM7xg@mail.gmail.com>
 <20251126144437.GL724103@e132581.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126144437.GL724103@e132581.arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_071452_736425_87AE6A89 
X-CRM114-Status: GOOD (  17.34  )
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

On Wed, Nov 26, 2025 at 02:44:37PM +0000, Coresight ML wrote:

[...]

> > As far as I recall when this command line parameter was a bool then:
> > perf -e cs_etm/timestamp/ <program>
> > is sufficient to turn on timestamping.
> 
> Hmm... with the latest perf, we must assign value to `timestamp`,
> otherwise perf will report error:
> 
>   # /mnt/build/perf record -e cs_etm/timestamp/ -C 0 -- taskset -c 0 ls
>   event syntax error: 'cs_etm/timestamp/'
>                        \___ Bad event or PMU
>   
>   Unable to find PMU or event on a PMU of 'cs_etm'
>   
>   event syntax error: 'cs_etm/timestamp/'
>                        \___ no value assigned for term
>   
>   event syntax error: 'cs_etm/timestamp/'
>                        \___ no value assigned for term
>   Run 'perf list' for a list of valid events

Apologize for this misinformation.  When `timestamp` is bool, it does
support the `-e cs_etm/timestamp/` format.

> > This is worth mentioning so users can correctly assess what happens
> > for any existing scripts they might have.
> > 
> > Based on this then the same command must set the timestamp to 1 -
> > which will have the same effect as before as we do not want to break
> > existing behaviour.

Not sure if we need to record such info.  Seems to me, it is weird that
record a common behaviour for perf formats in this doc.

The perf error log would be sufficient for users to setup a proper
format?

Thanks,
Leo

