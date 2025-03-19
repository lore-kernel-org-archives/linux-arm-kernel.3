Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 483A0C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 10:01:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qlSJQC4AGqNL57LAq4qvJ/T16DQo5pns6wsntwp00tk=; b=b5GMSPjBP+eI1o/eLmqFa+vrVh
	L9U9q2C45yXFI+dx8W/GcC5Nu3O0HNV+HZVPvA0CCu+KwbzrWtJ2jKFeBqiKj18kNKlcvNknBI86k
	WyZsGGZdJjYyvPOLMHCpriRGRC8i1tn5/Nnwpy2D2OnvCrISy18UsGVGg8Az9GT0QLmUGxt2XyPKw
	jS49tvfos36WwJt3WchYi/8bfaU5Jl0tqBQzdikyNu9HU5v1JRIj9TcbEEUiqEW2PUwrdN308ztbT
	DH3gec73uVkOVMBFhteT1yUCx6ATI1Kpej+bav5RC4llXc8YNNrklSKCCqSBhkLhtXpCXZaKcHcxb
	JlPgGhBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuqET-00000008bWP-2klF;
	Wed, 19 Mar 2025 10:01:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuq7u-00000008a5D-2oYZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 09:54:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B1DCD13D5;
	Wed, 19 Mar 2025 02:54:25 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC4AC3F694;
	Wed, 19 Mar 2025 02:54:14 -0700 (PDT)
Date: Wed, 19 Mar 2025 09:54:12 +0000
From: Sudeep Holla <sudeep.holla@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	<linux-kernel@vger.kernel.org>, <arm-scmi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <imx@lists.linux.dev>,
	<devicetree@vger.kernel.org>, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 0/7] firmware: scmi/imx: Add i.MX95 LMM/CPU Protocol
Message-ID: <Z9qURBnqtvbNoZ7K@bogus>
References: <20250303-imx-lmm-cpu-v3-0-7695f6f61cfc@nxp.com>
 <20250318082804.GA1326@nxa18884-linux>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250318082804.GA1326@nxa18884-linux>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_025418_747792_E3A9E158 
X-CRM114-Status: GOOD (  10.14  )
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

On Tue, Mar 18, 2025 at 04:28:04PM +0800, Peng Fan wrote:
> Hi Sudeep, Cristian
> 
> On Mon, Mar 03, 2025 at 10:53:21AM +0800, Peng Fan (OSS) wrote:
> >i.MX95 System Manager(SM) implements Logical Machine Management(LMM) and
> >CPU protocol to manage Logical Machine(LM) and CPUs(eg, M7).
> 
> Any comments?
> I am thinking to address comments and post v4 after 6.15 merge window close.
> 

Sure I will take a look later this week or next week.

-- 
Regards,
Sudeep

