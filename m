Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46674CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 09:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/TOPqYOBhfgS/RZwgQUzcPAM7S/4DdT4EvAjZidh0eo=; b=Pl/QbQuAJNIA50V4jpjHbX1vWp
	A12Fi05wvD1HDMHTZrIzoNPR38WcHbpigDqm6UPpTC2LrA6YbPKrInHFlIScUU5dntP1Cex4SOQGi
	DHfEVc0XW2h7kfGa/uEsbOuqMWH/v6hsvpxjyZvYZLdiiwjsQretlOkYXRUbHHUJ+LZEN9UKhRn2h
	JYBTFiD3WcbLdeI6ba/vC/HV7P7IP9taMsxHltKjkrJyym52xaqA55sY7evIhIPkYwWxpkqaaaa2g
	bFAB9jUZVXvtD2XPzFij+xm/f65QNN+CEmAlTTL+WWvxI9dHXWg6a+lghH/yDhdkMxm7iRwoUQuh4
	gf4hJl6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGQT-00000000r8m-2Afy;
	Tue, 19 May 2026 09:07:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPGQQ-00000000r7r-40lj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 09:07:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB8181692;
	Tue, 19 May 2026 02:07:35 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B78EA3F632;
	Tue, 19 May 2026 02:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1779181660; bh=Sar9yflNHsabnNZU4AVYywfJtAantv6N01mvNjoHBi0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gLPCiFNHNgV06N8T5NiyNw05iZn313C27CMy5S5PR0e3wmjcRYJHvY/TR361aIg8Z
	 LhWEYpWV5/XueeWa+Mtn2e9HOy2n9TOl2fNPb/bkRocpZJxyUS1yQlmX48SSoDVP92
	 6aYtMXbB1/ASlUFA5AyRq96+WAZcaFb5nmsf9Ebc=
Date: Tue, 19 May 2026 10:07:36 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/4] firmware: arm_scmi: Validate BASE_ERROR_EVENT
 payload size
Message-ID: <agwoWOQm_dPrQvwa@pluto>
References: <20260517-scmi_fixes-v1-0-d86daec4defd@kernel.org>
 <20260517-scmi_fixes-v1-2-d86daec4defd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517-scmi_fixes-v1-2-d86daec4defd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_020743_121503_DE9AE131 
X-CRM114-Status: UNSURE (   9.42  )
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

On Sun, May 17, 2026 at 08:02:41PM +0100, Sudeep Holla wrote:
> BASE_ERROR_EVENT carries a variable number of message reports,
> with the count encoded in error_status. The notification parser used
> that count without checking whether the received payload contained all
> reported entries.
> 
> Reject truncated payloads before copying the report array.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>


Not sure is the missing check was due to some sort of best effort
attempt to report whatever the platform was able to report or what...
...but it seems correct to check and discard corrupted replies.

LGTM.
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

