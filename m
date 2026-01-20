Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 855B4D2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 10:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NCA6Ur5hIE6inG+4oWduB7f+Tpmbjrg6xA88T96dz9c=; b=xTT6qDvj1NwaougdCvHITQiXld
	8Oduvl+f/wUoD/VyhLFRmbS+ci07k3xbkEzmjskYej69VpfEMC5XusXVkDF8Z/EcwliD/ndzaAePi
	XAXs2d03rPZLL6DIvAHehe2PPL1cs38+wwUQLj5l5tzr/WLyN+mFQHhmtb/n8x9iS5gayIM1Ei8HW
	sm8x5zBsyt0bH708g/M0ZU4g/QGJDohZAgeTKgU1+AFA7LQbSIiJr+bvuu2zewgw7tM2s8ntDOZFN
	OoMS+MzB5u1u1NCTc6ohuURfZ7gOU5w5xYt6sIidrPTmVijmKPMUmqkho8+fA1YXitHtmsk8od1G3
	wF4Ypwmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9OQ-00000003etZ-2YXx;
	Tue, 20 Jan 2026 10:55:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi9OM-00000003esm-3sdi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 10:55:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CAAE31476;
	Tue, 20 Jan 2026 02:55:14 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 34F293F740;
	Tue, 20 Jan 2026 02:55:19 -0800 (PST)
Date: Tue, 20 Jan 2026 10:55:12 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dhruva Gole <d-gole@ti.com>
Cc: Jonathan Cameron <jonathan.cameron@huawei.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	sudeep.holla@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@st.com, peng.fan@oss.nxp.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, elif.topuz@arm.com, lukasz.luba@arm.com,
	philip.radford@arm.com, souvik.chakravarty@arm.com
Subject: Re: [PATCH v2 01/17] firmware: arm_scmi: Define a common
 SCMI_MAX_PROTOCOLS value
Message-ID: <aW9fEESMiTAgp34Y@pluto>
References: <20260114114638.2290765-1-cristian.marussi@arm.com>
 <20260114114638.2290765-2-cristian.marussi@arm.com>
 <20260119111827.00001704@huawei.com>
 <20260120064419.by4nvmdgdybwe76q@lcpd911>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120064419.by4nvmdgdybwe76q@lcpd911>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_025523_011434_54CF7B56 
X-CRM114-Status: GOOD (  15.21  )
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

On Tue, Jan 20, 2026 at 12:14:19PM +0530, Dhruva Gole wrote:
> On Jan 19, 2026 at 11:18:27 +0000, Jonathan Cameron wrote:
> > On Wed, 14 Jan 2026 11:46:05 +0000
> > Cristian Marussi <cristian.marussi@arm.com> wrote:
> > 
> > > Add a common definition of SCMI_MAX_PROTOCOLS and use it all over the
> > > SCMI stack.
> > > 
> > > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > Hi Cristian,
> > 
> > Mention the introduction of SCMI_PROTOCOL_LAST in the patch description
> > and probably say why it takes that value (which is much less than
> > the SCMI_MAX_PROTOCOLS value).
> 
> Rather I wonder why even add it? Is it just like a documentation/ marker
> or is some other usage even planned for it?

It was a cleanup related to some changes that I then dropped from this
public series...I kept it since it seemed fine, but I will definitely drop
it in V3 since it is no more related or needed by anything in this
series.

Thanks,
Cristian

