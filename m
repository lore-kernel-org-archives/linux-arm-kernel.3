Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2997ECA0EFA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 09:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=056qMw93bZTj6RT6PqmY6ev0BP/BPL7ocy27ahF9+hc=; b=wrst4yib3u+p+Ki/3I2EIKLGwn
	EYKMuVjnCvTZ6StO43wDJtfl4RaNnXW66SjqjY9XpjjVDogrSXqy3cnMXGpNl/Fu4N+nNtK6O4o1J
	ohYy8Mv5OcPdb5dzyRD5YpksVpzXBTice/ZSqsGFy4iTJTapXIp5RhAnXG9oqiyb05fHa2ooJm7a5
	KBf4EOJQ/hjyFqh2eEm9OwR4ZEGnSWWDtTZpgWUzqNNPjveerjvZMkoNarJoMBBIEfAOhblpDpqEi
	dl1guUhX3ZpOzBH0zw1USIctZXKuK4zgQK25j2Pqd0uAYJesoQ4b1EibBF++prH0Dw5zLanp7Po7K
	SYlnVyPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upkhG-00000004Y1o-2Rt7;
	Sat, 23 Aug 2025 09:38:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphwd-00000004DcA-2bPq
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 23 Aug 2025 06:41:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=056qMw93bZTj6RT6PqmY6ev0BP/BPL7ocy27ahF9+hc=; b=Mz2hgVcJaupOUT7pFC3O1jPn2n
	Pq25DGokcO/f9nO+cWaUrn6hTAIt90eH+Dabvy/gVfS4Z3jIgltKi9Kizdch3CKUHgroWLDy9NZUh
	u5ModosoZItylznWHrqGHGpy2TXkRlkHYcn2XfMbryjfBw/fk9sTPObUN5cgsHwdMvYHvtqC/Sf6g
	pqV3G/35Ev0p4v0lfhg0PhgM/pfJKg+WjuKGtZfzSPLarAKsXnygp/IXrGX5Zj3jEbsQdrbY5KggT
	Fp0lYa0zpvdhfMabpE+27gL4J8l8hdPPaF1UBjQwQGRlh6UevuZSJfCUEPkoEG9znfb9RGhS4M6C1
	EOs9P8LA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uphwZ-00000001IqG-3WCb
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 Aug 2025 06:41:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AAA2F434E0;
	Sat, 23 Aug 2025 06:41:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05EA8C4CEE7;
	Sat, 23 Aug 2025 06:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755931297;
	bh=W2xSsVTOfKvNUrTWf8mlEmNx+BmGW/cRdE/WDxMwuCQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tgjf3fhy/95FjTkdKOoetheW/ejk9PsgRrIfYJ69pvVByfXzZF+BDHUjnaUQTFFI2
	 3etnY578RIuxhkTxEA9FHO4kZx8DLjXtNyKuW91mwTNcvLc/XSosyAAO8NMKMPEebd
	 cb/ucLkpzVx2e0jIOuR3lkwh0JJ22rHLQNsd98Ww=
Date: Sat, 23 Aug 2025 08:41:34 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Markus Elfring <Markus.Elfring@web.de>
Cc: James Morse <james.morse@arm.com>, linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org, devicetree@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Amit Singh Tomar <amitsinght@marvell.com>,
	Baisheng Gao <baisheng.gao@unisoc.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	bobo.shaobowang@huawei.com,
	Carl Worth <carl@os.amperecomputing.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dave Martin <Dave.Martin@arm.com>,
	David Hildenbrand <david@redhat.com>,
	Drew Fustini <dfustini@baylibre.com>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Fenghua Yu <fenghuay@nvidia.com>, Hanjun Guo <guohanjun@huawei.com>,
	Jamie Iles <quic_jiles@quicinc.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Koba Ko <kobak@nvidia.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Len Brown <lenb@kernel.org>, Linu Cherian <lcherian@marvell.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Peter Newman <peternewman@google.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rex Nie <rex.nie@jaguarmicro.com>, Rob Herring <robh@kernel.org>,
	Rohit Mathew <rohit.mathew@arm.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Xin Hao <xhao@linux.alibaba.com>
Subject: Re: [PATCH 10/33] arm_mpam: Add probe/remove for mpam msc driver and
 kbuild boiler plate
Message-ID: <2025082328-acorn-wound-5c3d@gregkh>
References: <20250822153048.2287-11-james.morse@arm.com>
 <00053767-352d-4185-8542-687da0fb5e57@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <00053767-352d-4185-8542-687da0fb5e57@web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_074140_296130_D2A00289 
X-CRM114-Status: GOOD (  19.83  )
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

On Fri, Aug 22, 2025 at 09:55:33PM +0200, Markus Elfring wrote:
> …
> …
> > +static int mpam_msc_drv_probe(struct platform_device *pdev)
> > +{
> …
> > +	} while (0);
> > +	mutex_unlock(&mpam_list_lock);
> > +
> > +	if (!err) {
> > +		/* Create RIS entries described by firmware */
> > +		if (!acpi_disabled)
> > +			err = acpi_mpam_parse_resources(msc, plat_data);
> > +		else
> > +			err = mpam_dt_parse_resources(msc, plat_data);
> > +	}
> > +
> > +	if (!err && fw_num_msc == mpam_num_msc)
> > +		mpam_discovery_complete();
> > +
> > +	if (err && msc)
> > +		mpam_msc_drv_remove(pdev);
> > +
> > +	return err;
> > +}
> …
> 
> * Would you like to integrate anything from the following source code variant?
> 
> 	if (!err)
> 		/* Create RIS entries described by firmware */
> 		err = acpi_disabled
> 		      ? mpam_dt_parse_resources(msc, plat_data)
> 		      : acpi_mpam_parse_resources(msc, plat_data);
> 
> 	if (err) {
> 		if (msc)
> 			mpam_msc_drv_remove(pdev);
> 	} else {
> 		if (fw_num_msc == mpam_num_msc)
> 			mpam_discovery_complete();
> 	}
> 
> * How do you think about to increase the application of scope-based resource management
>   at further places?
> 
> 
> Regards,
> Markus

Hi,

This is the semi-friendly patch-bot of Greg Kroah-Hartman.

Markus, you seem to have sent a nonsensical or otherwise pointless
review comment to a patch submission on a Linux kernel developer mailing
list.  I strongly suggest that you not do this anymore.  Please do not
bother developers who are actively working to produce patches and
features with comments that, in the end, are a waste of time.

Patch submitter, please ignore Markus's suggestion; you do not need to
follow it at all.  The person/bot/AI that sent it is being ignored by
almost all Linux kernel maintainers for having a persistent pattern of
behavior of producing distracting and pointless commentary, and
inability to adapt to feedback.  Please feel free to also ignore emails
from them.

thanks,

greg k-h's patch email bot

