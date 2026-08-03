Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 847CFC55162
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 06:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CQ3FXkdxeKWpPhELkqzv7K35M4eBOFi0oyoT0bpmWbM=; b=xlbr+6aQW+VB8NLXXddnuiwX+E
	OI+HDmNr34Wrz/U2L/GDyMg3f98zKinKpG21rvu8IAW0jj+hb68Wirjt54V3NsOWh8xHdnJlmgBvW
	HOUOIUSBhajjzQ6ybBQu7wcB4l3v4f0J4i/Svd24iz1cVVhU6n20AmbqMlZ6U95d1wUiyVRhGCZvX
	4rJ0IjOFGO1n0rSDEWrrivVADyt//CuLaAnFTaoe1vPrPkxzyb5EIzR+7lPdIGWysFMzSWNacROPy
	ykHKjiVueKtmWrtO34q3NW5IP5zHvNsYSTW2iLUcy34qJ+ilfQZ6nnrF30/fssDp9NKhQEKcgYim+
	gHJkKnsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqlzl-0000000GQo5-45T5;
	Mon, 03 Aug 2026 06:17:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqlzj-0000000GQnm-00pv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 06:17:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 359C6143D;
	Sun,  2 Aug 2026 23:17:45 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A88E3F66F;
	Sun,  2 Aug 2026 23:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785737869; bh=CQ3FXkdxeKWpPhELkqzv7K35M4eBOFi0oyoT0bpmWbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GR7C01RpF8anclulhv3lLdm+7g/UgSg5w56GRavq+rJ3vzytJVeGOQX3l1ViAxpkW
	 8TCVCQn79y931nRk4K9w1IzCFgIYkI4kUaHR0y4KMrr8fIWLiKrejS4NpQuGec9DOp
	 ss1cYF/ScRq4fYco1qNBoJA7lj86cgD196NfSXXQ=
Date: Mon, 3 Aug 2026 07:17:39 +0100
From: Cristian Marussi <cristian.marussi@arm.com>
To: Fayssal Benmlih <Fayssal.Benmlih@arm.com>
Cc: Cristian Marussi <Cristian.Marussi@arm.com>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"brauner@kernel.org" <brauner@kernel.org>,
	"d-gole@ti.com" <d-gole@ti.com>,
	"david@kernel.org" <david@kernel.org>,
	Elif Topuz <Elif.Topuz@arm.com>,
	"etienne.carriere@st.com" <etienne.carriere@st.com>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>,
	"james.quinlan@broadcom.com" <james.quinlan@broadcom.com>,
	"jic23@kernel.org" <jic23@kernel.org>,
	"kas@kernel.org" <kas@kernel.org>,
	"kernel-team@meta.com" <kernel-team@meta.com>,
	"leitao@kernel.org" <leitao@kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Lukasz Luba <Lukasz.Luba@arm.com>,
	"michal.simek@amd.com" <michal.simek@amd.com>,
	"peng.fan@oss.nxp.com" <peng.fan@oss.nxp.com>,
	Philip Radford <Philip.Radford@arm.com>,
	"puranjay@kernel.org" <puranjay@kernel.org>,
	Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
	"subrahmanya.lingappa@oss.qualcomm.com" <subrahmanya.lingappa@oss.qualcomm.com>,
	"sudeep.holla@kernel.org" <sudeep.holla@kernel.org>,
	"usama.arif@linux.dev" <usama.arif@linux.dev>,
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>
Subject: Re: [PATCH v6 00/22] Introduce SCMI Telemetry support
Message-ID: <anAyg0hr3S6mfIYX@pluto>
References: <DB9PR08MB86510C934D2EF25F625A5F38FFCC2@DB9PR08MB8651.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DB9PR08MB86510C934D2EF25F625A5F38FFCC2@DB9PR08MB8651.eurprd08.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260802_231751_080274_E52740C9 
X-CRM114-Status: UNSURE (   6.84  )
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

On Mon, Jul 27, 2026 at 02:53:45PM +0100, Fayssal Benmlih wrote:
> Hi Cristian,

Hi Fayçal,

just a quick one to say that the latest v7 just revolved around making
ABI feature complete, so closing most of my pending TODO list...I have
NOT addressed, if NOT minimally, these outstading issues or most of
Sashiko reports....I will take care of all of these starting v8
tomorrow..

Thanks,
Cristian

