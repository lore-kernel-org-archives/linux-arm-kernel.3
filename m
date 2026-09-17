Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA6FC982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 19:04:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gzQp6LW1nXvwBEwBhGNPe+tNOASC0dgPxppHtMaIJkM=; b=QLq8WJMDE1WBZz2Ri4/t2OdlEG
	yEBfH4MSqrIBskmMLuor7KCKQk2PLpjMMRKAg3W9JSFHW8ypA2bkqagIQjFLg0fK5snd+mcGtByiD
	pN9ztQCTUMSFveKYeDngdo1cQ3V7ynFdWvb781fEfUkOoiH/X6oAfnV2WNwfjU0JoIMBPQvyZaE1m
	oDKa/0fVMJC7/4oT3RzzUGibihk7ts5/0hFQCDKgUuNy3E6DbYpdpkgz5HuIiSXq9uWdpZW9Pe/L2
	2pON8uNLlZvlUJjtXThzZTySoNzuD8sD6d4WT5wwIB/q0skN+HFWamp2PGgSHYxnM5N4wbzW+o+c7
	64fTIqgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7HP0-0000000CIkZ-3n0b;
	Thu, 17 Sep 2026 19:04:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7HOy-0000000CIkC-2d0F
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 19:04:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C6A83601EF;
	Thu, 17 Sep 2026 19:04:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51E801F000FF;
	Thu, 17 Sep 2026 19:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789671847;
	bh=gzQp6LW1nXvwBEwBhGNPe+tNOASC0dgPxppHtMaIJkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=k48NjLkHVhtOalPBGpW0mEiCAI8LrDMLOLiZZXWRnf6WbeYW47QCVsuZaVq3BD6PS
	 XUj//7Wh+NEwRa44zMB7p+gOfG4tMr0K9Fi+m735eHJ7v8M139VmX1Ri7YIcA5LtVY
	 ZryHyhQrvuiNZ9NBiopiVKxfWj4eRtwA6+AkAWaHss8V28snEBfZgiA9uQUpOQzN6+
	 s+JLhtI68GSF75d1C8CD9Hr3S8EOcR+AZuNZPLVqFyJDUEdOmja5kkOxJb6PrtMtNZ
	 oWIryW6xoOLDS0OV5YGZqloxJtvl0jkE/QfLDaQQM5e6sEcdSvaYVuoEHIJWaEiQwD
	 oecVv3ZxWaUbA==
Date: Thu, 17 Sep 2026 14:04:06 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2] dt-bindings: mailbox: Delete old 'mailbox.txt'
 bindings file
Message-ID: <178967102478.3104808.16225171904149470188.robh@kernel.org>
References: <20260814124603.v2.1.I8b3ff71c528133e7d6f81fe926fa39e6451d63fd@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260814124603.v2.1.I8b3ff71c528133e7d6f81fe926fa39e6451d63fd@changeid>
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
Cc: Lee Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, Samuel Holland <samuel@sholland.org>, Jassi Brar <jassisinghbrar@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Konrad Dybcio <konradybcio@kernel.org>, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>, linux-tegra@vger.kernel.org, Chen-Yu Tsai <wens@kernel.org>, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


On Fri, 14 Aug 2026 12:46:12 -0700, Douglas Anderson wrote:
> As per mailing-list discussions [1] [2] [3], we want to delete the
> following old file from the device-tree bindings that live in the
> Linux kernel git tree:
> * Documentation/devicetree/bindings/mailbox/mailbox.txt
> 
> The old .txt file did have some descriptive text about what some of
> the properties meant. Those have been added to the dt-schema
> repository in a pull request [4].
> 
> Also remove dangling references to `mailbox.txt` across all remaining
> device-tree binding documentation files.
> 
> Link: https://lore.kernel.org/r/20260722140214.GA548057-robh@kernel.org [1]
> Link: https://lore.kernel.org/r/dc7a2041-50a4-482e-9930-566bb3fd1e72@kernel.org [2]
> Link: https://lore.kernel.org/r/CAL_JsqKVjQ2m-dzMUENQry-f_YE9QrYSOKoH9CPj1gjj8XkPRA@mail.gmail.com [3]
> Link: https://github.com/devicetree-org/dt-schema/pull/202 [4]
> Cc: Sudeep Holla <sudeep.holla@kernel.org>
> Cc: Jassi Brar <jassisinghbrar@gmail.com>
> Cc: Lee Jones <lee@kernel.org>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> - v1: https://lore.kernel.org/r/20260804133801.1.I8b3ff71c528133e7d6f81fe926fa39e6451d63fd@changeid
> 
> Changes in v2:
> - Remove dangling mailbox.txt references as per Sashiko.
> 
>  .../firmware/nvidia,tegra186-bpmp.yaml        |  6 +-
>  .../mailbox/allwinner,sun6i-a31-msgbox.yaml   |  3 -
>  .../bindings/mailbox/altera-mailbox.txt       | 12 ++--
>  .../mailbox/hisilicon,hi3660-mailbox.txt      |  2 +-
>  .../mailbox/hisilicon,hi6220-mailbox.txt      |  2 +-
>  .../devicetree/bindings/mailbox/mailbox.txt   | 60 -------------------
>  .../bindings/mailbox/ti,omap-mailbox.yaml     |  3 +-
>  .../power/reset/xlnx,zynqmp-power.yaml        |  9 +--
>  .../bindings/soc/qcom/qcom,aoss-qmp.yaml      |  2 +-
>  9 files changed, 15 insertions(+), 84 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/mailbox/mailbox.txt
> 

Applied, thanks!


