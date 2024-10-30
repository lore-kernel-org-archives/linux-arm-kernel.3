Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B01C5D5CCB4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 14:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GWhDLschdc3DuOs87kaMzDvVhpA+L0kr+TALB3AaayE=; b=cdb6T6Kn+LRvPOS/C4wz8r4jJK
	+NzGKFm3IDgSYmAoys8/KkLWsuXMBexUxzS6o1YZoJcX6uTEnz1szV395zRjOfiHXzFPmpy2LGjyJ
	gbayRDzEL3hGS0hftECe+EVI9e9PacfEj+YW0qyPk6l5tvfZi3C+AMNFlQL5JpD8rr/yuroGPBsKs
	12R3HyHGZvAdkHSLTo2rqgQJlVKXhgsHVy+WXSrTCKsECBmYvWMJKOJot5xyoxuuZFtmu3qbBQg6S
	ti+uKxopSCzO6KQCajfhLXvJGSH2wfTz7cWKZgz67tscJW8LSp5DwYE1BkSiOPab+Idb0VrZKSF6z
	piv+JpRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t69sl-00000000gvD-36NJ;
	Wed, 30 Oct 2024 14:41:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t69r7-00000000glg-0rAW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 14:39:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5E5FB113E;
	Wed, 30 Oct 2024 07:39:57 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F65D3F528;
	Wed, 30 Oct 2024 07:39:25 -0700 (PDT)
Date: Wed, 30 Oct 2024 14:39:17 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Sibi Sankar <quic_sibis@quicinc.com>
Cc: sudeep.holla@arm.com, cristian.marussi@arm.com, johan@kernel.org,
	ulf.hansson@linaro.org, jassisinghbrar@gmail.com,
	dmitry.baryshkov@linaro.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, konradybcio@kernel.org,
	linux-pm@vger.kernel.org, tstrudel@google.com, rafael@kernel.org,
	Johan Hovold <johan+linaro@kernel.org>
Subject: Re: [PATCH V5 3/6] firmware: arm_scmi: Report duplicate opps as
 firmware bugs
Message-ID: <ZyJFFUx_EUicAfQN@pluto>
References: <20241030125512.2884761-1-quic_sibis@quicinc.com>
 <20241030125512.2884761-4-quic_sibis@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241030125512.2884761-4-quic_sibis@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_073929_316508_A3B1A740 
X-CRM114-Status: UNSURE (   6.89  )
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

On Wed, Oct 30, 2024 at 06:25:09PM +0530, Sibi Sankar wrote:
> Duplicate opps reported by buggy SCP firmware currently show up
> as warnings even though the only functional impact is that the
> level/index remain inaccessible. Make it less scary for the end
> user by using dev_info instead, along with FW_BUG tag.

Thanks for this.

LGTM.
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

