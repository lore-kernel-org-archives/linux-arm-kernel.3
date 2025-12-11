Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF8A2D41C09
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 09:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nblqFC+s5BLVbu1o11qhoniXxgeWcTc+3dYwm0cVXI0=; b=xbWn0rpYZWIfKZr9+jiDryzwJO
	wY9wVAyVLY8c30suUN4cKd+5yXqDAJUbw8E4j6CkP+snNH7wD2rIJUkdyWSvZlP/y8r+twwGDD6wE
	JXUfLqiX9lsmHU4KtxfSLRRBpdoxChV+LrHA0NRYKk26/dtgJLwTxAm+zGTFgrLynaCbVPnVDAaCL
	S7Bhov6Af96Dfpkl8L5KsZ50GL3ixWn0wPMifsjG5tD2Q4XziqFx5nnEYdJww4gVXpT04NmxSbx0o
	758ox+nyspdpc03LQjiEqeFIh46ze+B2rRm3Riyc7ERfYFDVPvqD8uotJ+etrcrE4TMjRC70/ydbp
	/KruIjuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTdJj-0000000GSW5-1PgV;
	Thu, 11 Dec 2025 09:50:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTdJh-0000000GSVg-0FWF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Dec 2025 09:50:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CCD3C153B;
	Thu, 11 Dec 2025 01:50:24 -0800 (PST)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B81683F740;
	Thu, 11 Dec 2025 01:50:30 -0800 (PST)
Date: Thu, 11 Dec 2025 09:50:27 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Vivek Aknurwar <vivek.aknurwar@oss.qualcomm.com>
Cc: cristian.marussi@arm.com, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	mike.tipton@oss.qualcomm.com
Subject: Re: [PATCH 1/1] firmware: arm_scmi: Increase MAX_OPPS to 64
Message-ID: <20251211-delectable-axiomatic-hummingbird-55a792@sudeepholla>
References: <20251014073454.461999-1-vivek.aknurwar@oss.qualcomm.com>
 <6af5945e-7d5c-4596-ac42-c5898b4c49b7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6af5945e-7d5c-4596-ac42-c5898b4c49b7@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_015033_135182_82037B3E 
X-CRM114-Status: UNSURE (   9.02  )
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

On Wed, Dec 10, 2025 at 03:28:37PM -0800, Vivek Aknurwar wrote:
> Hello Sudeep/Cristian,
> 
> Just following up on this patch. If there’s anything missing or
> needs adjustment, please let me know.
> 

Sorry seem to have slipped through the cracks while I was away. I will
queue it for next merge window soon.

-- 
Regards,
Sudeep

