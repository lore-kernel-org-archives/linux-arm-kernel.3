Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE68CFEE4DC
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Feb 2026 09:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bqk0YLpRhW5nEa0umhkcf4HuaPIUT0DDPWDGWSEemcI=; b=biXAghiQB3w73ICEzWqJnN4dME
	9drhZCVtRf3llLC4T0EmTiroD0hPF4/p7h53BRvTNisY1Y4EKTgqfQN/BVSTh5pv25iBCr2zcm9VC
	CWLYwYn5KCmuRn27PZ9bz7gSqaRIXGBUM1tvtLkddF9h5Is7sxngEUNZoeIMExRR5fm8erZmgOaBq
	iOrv1bs/iXYQ6tJhMybgsdqjxGkKU66JHYZ74qMQCZ83mM3XshRISutZ32Cyo7OXRXcz3OoQbKMJp
	JJz3fYsV9pAbX4U1XfMh4K9wTnJOXe3wfH1ZAwbhcryb64ElUgjC0sxcPw82oLw43ZPK3k+51PM8w
	5W6/8vnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwGKW-00000009g1m-40FQ;
	Sat, 28 Feb 2026 09:09:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwGKT-00000009g1O-1Mu8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Feb 2026 09:09:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0BAC91516;
	Sat, 28 Feb 2026 01:09:33 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 49CA33F73B;
	Sat, 28 Feb 2026 01:09:36 -0800 (PST)
Date: Sat, 28 Feb 2026 09:09:28 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Brian Masney <bmasney@redhat.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v7 5/6] clk: scmi: Introduce common header for SCMI clock
 interface
Message-ID: <aaKwyDXtqdx-ysRy@pluto>
References: <20251231-clk-ssc-v7-1-v7-0-380e8b58f9e3@nxp.com>
 <20251231-clk-ssc-v7-1-v7-5-380e8b58f9e3@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251231-clk-ssc-v7-1-v7-5-380e8b58f9e3@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260228_010941_435684_3B2A50AA 
X-CRM114-Status: UNSURE (   9.05  )
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

On Wed, Dec 31, 2025 at 06:12:52PM +0800, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Added a new header file 'clk-scmi.h' to define common structures and
> interfaces for the SCMI clock driver. This header will also be used by
> OEM-specific extensions to ensure consistency and reusability.

Hi,

> 
> Moved relevant structure definitions from the driver implementation to
> 'clk-scmi.h' to facilitate shared usage.
> 
> Reviewed-by: Sebin Francis <sebin.francis@ti.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>


LGTM.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>

Thanks,
Cristian

