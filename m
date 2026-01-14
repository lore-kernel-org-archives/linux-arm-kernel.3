Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43B4D29FF7
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 12:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hiQAyAGaTklDiE5d3K2rREYbl+X7hXd2COWAipHE4Ug=; b=aHq4LgtoyzlKlj5aDG1fsWaq6v
	aXal7ROwtjdA0TPsqYKJ7QC3I2Md+C6kpmAV59MzLA4K3NaWdXp57FJWwTCT7TBhvZu67pi0h60sZ
	OLuOx3dBdxP+L2GNByJy0tydBVCHnnYsSV81VCMp6kuqXpnyeRzpPb2vtMRi0A2+a+3kxIXeWQE5G
	qscYZTJKJxAwID9YI+MM/B5ejtmU53Ppvc/rgkxD/BrJ6/A6qciMtD/EGe8jq37GjC9L7EfYMQX/Q
	8Ak/23HxFgOPeD52BIpo890ewmf0FT/my726Vc9VLf+7bFXnElsXL1PZJz6ABEvRCVmHYA5fx6tjf
	D8EVPZUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfztb-00000009A4R-0fi2;
	Wed, 14 Jan 2026 12:22:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfztY-00000009A3h-3TRB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 12:22:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 61D3C1424;
	Wed, 14 Jan 2026 04:22:33 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.197.51])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 320D63F632;
	Wed, 14 Jan 2026 04:22:39 -0800 (PST)
Date: Wed, 14 Jan 2026 12:22:37 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Sergey Shtylyov <s.shtylyov@auroraos.dev>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>, arm-scmi@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] cpufreq: scmi: correct SCMI explanation
Message-ID: <aWeKjehftu2GFj4m@bogus>
References: <e6c2e7af-ad87-4d38-9dbb-f9d6ae81fe83@auroraos.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e6c2e7af-ad87-4d38-9dbb-f9d6ae81fe83@auroraos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_042240_927417_27772244 
X-CRM114-Status: UNSURE (   7.27  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jan 13, 2026 at 10:33:30PM +0300, Sergey Shtylyov wrote:
> SCMI stands for System Control and Management Interface, not System Control
> and Power Interface -- apparently, Sudeep Holla copied this line from his
> SCPI driver and then just forgot to update the acronym explanation... :-)
>

Yikes! Indeed it is copy-paste. Thanks for spotting and fixing this.

Reviewed-by:  Sudeep Holla <sudeep.holla@arm.com>

-- 
Regards,
Sudeep

