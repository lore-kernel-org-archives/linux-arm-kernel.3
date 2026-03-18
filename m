Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B935FCD0CE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 08:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ySLY6ZdksT0U+KDEyDXq52HuggEr8Wzx/UnErnvAN8M=; b=d4Xis27StFtlYujThk+KNK/ALm
	VJ30YM+j7Jepqs2wRJ8wP/0TqFAhR87gEWgHZnGtouvhCo+/TOdUmPN1X1unV4Fea3+Fxm7Dsbsw9
	yucYVA2P9osxECu3Zr2dAI6MCohhikjDSpPkdVT/hOLe6Jt0ApJgsw/X3KzRNQ6J3EAyWWfmC5RkM
	xZeE/2RiFL0yKCqI34Jb13TFs3De2gLR1GirtXbBEjwrwLBSb+r/IcnlXTJH95G18zixH+cisjS3a
	BabCZA/xcA6qnbIEvew43sGSQqzB4RtaDoIIoO1UAMW2yKXcVRP25MR5rivxr5RXlcMAaqan5ZlZb
	sfF38q3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2luU-00000007zKl-1KmT;
	Wed, 18 Mar 2026 08:05:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2luS-00000007zKL-13L8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 08:05:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DB3E543E35;
	Wed, 18 Mar 2026 08:05:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 349F2C2BC87;
	Wed, 18 Mar 2026 08:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773821143;
	bh=Qc6PEueF/4SSizOeU1vmWiNbHvecrFZC6uo4QlV9nWU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FB09mq7l0CTNfYyjd/q9FjQogVQrfAYSCrUMw0Hspct184Js6bmwH18uQ0OOcffNs
	 E9OFyyEheK0Cu31gWzbIa3FdYQmriB9y5ognX5zlYFhehixWfFytltbuWZwuyCC2S7
	 IZfeUXWEorXbI7S9kdOIvJtltVkhStWJXeCzagzEucjEdSECG+NTq8apYNub22ozlQ
	 G5ABmypXqP0Xs3fr2g6luPEKN1GcwfIcHgCKZ/5iHNVUBRs0RqLIXuQFx8heC+LvY+
	 ALizfyBAUGOOYKgF6I25rnZXtrGDbacEONeKPDq8rqiQXUpDnQpp68TcO5PQCd6Y9o
	 xEv51T61Uj90g==
Date: Wed, 18 Mar 2026 09:05:41 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v2 6/8] firmware: smccc: lfa: Add auto_activate sysfs file
Message-ID: <20260318-inventive-adept-silkworm-4efefb@quoll>
References: <20260317103336.1273582-1-andre.przywara@arm.com>
 <20260317103336.1273582-7-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317103336.1273582-7-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_010544_307041_1C64979F 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, Salman Nabi <salman.nabi@arm.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org, vwadekar@nvidia.com, Sudeep Holla <sudeep.holla@kernel.org>, vsethi@nvidia.com, Nirmoy Das <nirmoyd@nvidia.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Mar 17, 2026 at 11:33:32AM +0100, Andre Przywara wrote:
>  
> @@ -115,6 +116,7 @@ struct fw_image {
>  	bool may_reset_cpu;
>  	bool cpu_rendezvous;
>  	bool cpu_rendezvous_forced;
> +	bool auto_activate;
>  	struct kobj_attribute image_attrs[LFA_ATTR_NR_IMAGES];
>  };
>  
> @@ -561,6 +563,28 @@ static ssize_t cancel_store(struct kobject *kobj, struct kobj_attribute *attr,
>  	return count;
>  }
>  
> +static ssize_t auto_activate_store(struct kobject *kobj,
> +				   struct kobj_attribute *attr,
> +				   const char *buf, size_t count)

Where is this ABI documented?

Best regards,
Krzysztof


