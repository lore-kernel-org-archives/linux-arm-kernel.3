Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D63E9B369
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 11:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HwkulfnnhN9S//DfFh/pzckI71PWScT+HU+XPVKfNjo=; b=KPN6zTuCYdeVej/P4s8Wk0QyhJ
	apHLP9BwGSu6POTYX6K0lkvcoiUIYZvhqZ04V0XqMu5FEQ3w1+4frMPq8eHXg6EtVeTNx8QML4lDY
	v11GrcidEIqeaGEz7tDBeZX7bXgH6XLoLcmLSbcSTONcPSDmc2XRo61kH5EUZY7VXMhwgD3nt7gQC
	GGODFTjvOVXrUd2tZUaJSAlYR1RaHiEbKI8xN95TStQCj8iYOm+/q5pKjahm/R9eEjH9+7CPDk4nA
	LyVyNyRinZV7r4ZmAMP8NWYcCBbIeQNCXmb35LsZmtSSikFrWfBOswW3I4XD1fmL5pAE4I22397OR
	7WqSsO4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1AJ-0000000Cml7-3Uh3;
	Mon, 02 Mar 2026 11:10:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx1AH-0000000Cmkm-49N2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 11:10:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4481D14BF;
	Mon,  2 Mar 2026 03:10:10 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2B063F73B;
	Mon,  2 Mar 2026 03:10:12 -0800 (PST)
Date: Mon, 2 Mar 2026 11:09:50 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Brian Masney <bmasney@redhat.com>, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v7 6/6] clk: scmi: Add i.MX95 OEM extension support for
 SCMI clock driver
Message-ID: <aaVv35RJH_hgoxQu@pluto>
References: <20251231-clk-ssc-v7-1-v7-0-380e8b58f9e3@nxp.com>
 <20251231-clk-ssc-v7-1-v7-6-380e8b58f9e3@nxp.com>
 <aaK9HOMWNCb0wzq_@pluto>
 <aaVN5lr3JBi6LwYX@shlinux89>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aaVN5lr3JBi6LwYX@shlinux89>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_031018_124305_30D2427B 
X-CRM114-Status: GOOD (  20.75  )
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

On Mon, Mar 02, 2026 at 04:44:22PM +0800, Peng Fan wrote:
> Hi Cristian,
> 

Hi,

> Thanks for reviewing!
> 
> On Sat, Feb 28, 2026 at 10:02:04AM +0000, Cristian Marussi wrote:
> >On Wed, Dec 31, 2025 at 06:12:53PM +0800, Peng Fan (OSS) wrote:
> >> +
> >> +struct scmi_clk_oem_info {
> >> +	char *vendor_id;
> >> +	char *sub_vendor_id;
> >> +	char *compatible;
> >
> >I suppose different OEM per impl_ver is overkill...and maybe better
> >to be trated as a bug if it happens leveraging the Quirk framework..
> 
> Hope I not get you wrong. impl_ver is not used here.
> compatible is machine compatible string.
> 

Yes.
> The OEM matching introduced in this patch is strictly based
> on SCMI vendor_id and sub_vendor_id as reported by the firmware. There is no
> dependency on impl_ver, nor do we intend to distinguish OEM behavior based on
> implementation version.
> 

Ok, good, I was just checking my understanding was correct and we are on
the same page and this is how you intended to use all of the above..

> If in the future any firmware shows inconsistent behavior across different
> impl_ver, we agree that this should be treated as a firmware bug and
> handled through the existing SCMI quirk framework.
> 

Ok.

> I could add a comment for the structure in next version:
> /*
>  * Selection is based on SCMI vendor_id/sub_vendor_id and optional machine
>  * comaptible string, without involving impl_ver. impl_ver‑specific behavior
>  * should be handled via the SCMI Quirk framework

maybe...

    "should be considered a bug and handled via SCMI Quirk..."

BUT I have no strong opinion about the need of this comment...do it as you
wish, with or without for me is fine.

Thanks,
Cristian

