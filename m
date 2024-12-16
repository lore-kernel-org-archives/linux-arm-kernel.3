Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC52AE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 10:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uX3GRQY8ZjoFkYOsoectf+6ARiXV3tO9qdpKTI0l3jI=; b=MmUczYW2GN/MZu
	DO2LXpbKXl97nilHBoRCFaND+RoEzLB61gxwE4X8m7RTpW7ADFwbqG64K4G/lbNWkJNe7R1I94vlX
	lXoqqiwU7BX5YCNGGrPFDDhX9tfxzFELFTw6u/beJvBfOOQaYhYH7+jgS3kkNc7fJs+l+iM6gqzza
	Edut76wwE3rua92JrGroFZI8yAWczwayI4KL2GNu6JcP6YnosRky316njU8ZZcBao2F7iY7UcwGfW
	1zCmf8VrcfT7Mlqx1WzG+ZXK3sZr1L+jgHE24YKlHRjSqPZQqLoWq6Q0+WPylk/HTPx5eWEdcenzO
	63bj4MC2aMPm4euU7fng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8HF-00000009h4h-3bNR;
	Mon, 16 Dec 2024 10:24:37 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tN8G9-00000009gtp-03VA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 10:23:30 +0000
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BGANJAT3534883
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Dec 2024 04:23:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734344599;
	bh=uX3GRQY8ZjoFkYOsoectf+6ARiXV3tO9qdpKTI0l3jI=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=oEktoE4aCS2xjadU5ED3jaR2J1oHjDhRc+M2DRBX0FEEt+UUpvfqqEtimb9B9oqfg
	 xuC+yrxMhZIUMHRH+9Vg2zgjD+O2yJ61c0eHU9yulLUwKNMb/qqUwtWGjJRmhT8yto
	 9kNIQvs8x3v6ss341kNl2I7FSXUdEwS8sGbH3ROQ=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BGANJqK077479
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Dec 2024 04:23:19 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 16
 Dec 2024 04:23:18 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 16 Dec 2024 04:23:18 -0600
Received: from [10.24.69.25] (danish-tpc.dhcp.ti.com [10.24.69.25])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BGANE26104700;
	Mon, 16 Dec 2024 04:23:15 -0600
Message-ID: <7c48ccdc-41b3-4205-854d-9b7a60f70da2@ti.com>
Date: Mon, 16 Dec 2024 15:53:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] Add Clocks for ICSSG
To: <conor+dt@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <ssantosh@kernel.org>, <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
References: <20241113110955.3876045-1-danishanwar@ti.com>
Content-Language: en-US
From: MD Danish Anwar <danishanwar@ti.com>
In-Reply-To: <20241113110955.3876045-1-danishanwar@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_022329_147327_092AB5C2 
X-CRM114-Status: GOOD (  17.53  )
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
Cc: srk@ti.com, devicetree@vger.kernel.org, kristo@kernel.org, linux-kernel@vger.kernel.org, Roger Quadros <rogerq@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi Vignesh / Nishant

On 13/11/24 4:39 pm, MD Danish Anwar wrote:
> This series adds clocks for ICSSG for AM64x.
> 
> PATCH 1/2 Adds the dt binding necessary to add clocks to the device tree.
> It adds the `clocks` in the dt binding of ICSSG node. Each ICSSG instance
> has 7 clocks available to them as per AM64x TRM [1] Section 6.4.3 Table 
> 6-398. They are not added in the dt bindings yet. This patch adds all
> available clocks to ICSSG bindings. 
> 
> PATCH 2/2 Adds the required clock to the ICSSG nodes. It also changes the
> clock used from clock 20 (ICSSG_ICLK) to clock 0 (ICSSG_CORE). This patch
> adds the clock-names, assigned-clocks and assigned-clock-parents to icssg
> nodes.
> 
> More details on clocks can be found at [2]
> There is no additional driver changes needed for this binding change.
> 
> Changes from v2 to v3:
> *) Modified commit message of PATCH 1/2 to state why clocks are being added
> to the binding.
> *) Added all available clocks to ICSSG bindings. Earlier only two clocks
> were added.
> *) Added all available clocks to AM64x DTS. Earlier only two clocks were
> added.
> 
> Changes from v1 to v2:
> *) Dropped assigned-clocks and assigned-clock-parents from DT binding as
> suggested by Krzysztof Kozlowski
> 
> [1] https://www.ti.com/lit/pdf/spruim2
> [2] https://software-dl.ti.com/tisci/esd/latest/5_soc_doc/am64x/clocks.html#clocks-for-pru-icssg0-device
> v1 https://lore.kernel.org/all/20241107104557.1442800-1-danishanwar@ti.com/
> v2 https://lore.kernel.org/all/20241108142946.2286098-1-danishanwar@ti.com/
> 
> MD Danish Anwar (2):
>   dt-bindings: soc: ti: pruss: Add clocks for ICSSG
>   arm64: dts: ti: k3-am64-main: Switch ICSSG clock to core clock
> 
>  .../devicetree/bindings/soc/ti/ti,pruss.yaml  | 10 +++++++++
>  arch/arm64/boot/dts/ti/k3-am64-main.dtsi      | 22 +++++++++++++++++--
>  2 files changed, 30 insertions(+), 2 deletions(-)
> 
> 
> base-commit: bd05b9a700c10473c2f52bf12c5c5938c30e80b0

This series still applies cleanly on latest linux-next (next-20241216)
and doesn't need a re-base.

Can you please pick this.


-- 
Thanks and Regards,
Danish

