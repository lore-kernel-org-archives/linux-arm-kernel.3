Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5952FFF4953
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 07:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ipTPP1XlOddaNoYfGBkULV8xtWZpbug22Z6U06d+ZsI=; b=rjXzFzrMphGqg8XXh2H0KTUzIq
	+zWgzlpVXLOmyoIVPOI5cSdtXKLCKk9sZ8j2ZsB/46wjx7FHMNLhXMNdsaukhETnhwW6KhWIPU1T9
	y2msT2sC5UChq4d14b5IA6mCk/6PWLgLP7vx3Vo/yaNOE8ave/8N9iM4TicjQyW+qNYaq9oB7V8tP
	+rcyAFFmlYdZklD8IfgUF2DyqvegsQtlvr3DzuDGNz4P/57ZXINKyDP9hjbqO68WAGCm7nC2QpKA3
	CYhHe5qaUKIe6Ee/C+BCv5+0Y72b0PeI1gqTzlNCNWmUXTz7is4mJZBpNOhd1rlOZj+NuaThzVi3l
	mo4IL15Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w76iB-0000000AjOD-3Rp1;
	Mon, 30 Mar 2026 07:06:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w76i9-0000000AjNx-3xlI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 07:06:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C7293600AC;
	Mon, 30 Mar 2026 07:06:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7970C4CEF7;
	Mon, 30 Mar 2026 07:06:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774854416;
	bh=tbeI2CcasPRtwv8iA2a3z67oAioDgSrzrqJj0Lvy6dU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R7Lzvw0/CvCt6nx9RIVeH6gsDAymRXP2mPNrKQmC4XaEMZHKS1CxqQ1aY6C+GaPwt
	 x6TVDmN7iNo9NNcbkbxd1PZ3/OXJ+HFadScvbHKcFgymzgjwJYBIEPFCzFqTmJOvMj
	 V7Y2KTPqgX0lZ5lySPwHD8lxME2XTjRVUnxDcVLMjvPRFPuXUqhC1DFQiqN7h76o66
	 G7N3Okh7e8JXp0sRLGzJQWbvpZ9V7fb7mQUHTIr74c2wnEZV/M0TEfvqA5Ahv6IlMW
	 VA6pNV+DVFIz6REDPZ3AATIDn6Q574jKRLhVouSkbU7/HeR/mHqKMT7EdGnkErO9pY
	 mnOaCEAwpUDoA==
Date: Mon, 30 Mar 2026 09:06:53 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gopi Krishna Menon <krishnagopi487@gmail.com>
Cc: rafael@kernel.org, daniel.lezcano@kernel.org, rui.zhang@intel.com, 
	lukasz.luba@arm.com, robh@kernel.org, krzk+dt@kernel.org, vireshk@kernel.org, 
	conor+dt@kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
	daniel.baluta@nxp.com, simona.toaca@nxp.com, d-gole@ti.com, m-chawdhry@ti.com
Subject: Re: [PATCH v3 2/2] ARM: dts: st: spear: remove undocumented
 thermal_flags property
Message-ID: <20260330-furry-apricot-toucan-bb8d8d@quoll>
References: <20260329123449.309814-1-krishnagopi487@gmail.com>
 <20260329123449.309814-3-krishnagopi487@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260329123449.309814-3-krishnagopi487@gmail.com>
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

On Sun, Mar 29, 2026 at 06:04:44PM +0530, Gopi Krishna Menon wrote:
> spear13xx.dtsi defines a thermal_flags property in spear thermal sensor
> node which is both unused in kernel and undocumented in spear thermal
> sensor's binding.
> 
> There were no dtbs_check warnings associated with this property as the
> underlying spear thermal binding was not converted to DTSchema.
> 
> Most likely st,thermal-flags is a misspelling of thermal_flags in
> spear13xx.dtsi. Since both st/spear1310.dtsi and st/spear1340.dtsi
> define st,thermal-flags property in spear thermal sensor node, we can
> safely remove this property from spear13xx.dtsi.
> 
> Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


