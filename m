Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76540C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 08:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1HBZdAOBDJbiT3troDQEduecEfz2C1FQBqQQFhxgGMw=; b=2l9404IFqo3anfNc7UO0hVD4NH
	xU5iFr3ibVBn8cWDMYb1+Vhe2g2t3CxFNRSetS09wS7ykrucNGfmnvX/F4xBA/277h5ryxql4PTQu
	Im0unyfOTtW3AUrTvEuDh71WI9Y9n/ED7lILD/DdF2OkrmmCYSoH/2TKBFZShrLlI1NREKn24EvrP
	nSEvHANrSg117P3lGfqehe3THhgQRC2hBG40oF5xfROexyU+rcQlrJzfB0XYZaLCAj2JxoWWskK7K
	JYepCW2wmQcFcWlaf1C9/PnGyrPlykEka4NoI6TRRHlxSOGFQfvt2pbiYSJEiRUu9Qg/GIJf88Vo7
	KqF7pUFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuSae-00000005DDL-1rM3;
	Tue, 18 Mar 2025 08:46:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuSYx-00000005CuM-1HXd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 08:44:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8EE7B5C4782;
	Tue, 18 Mar 2025 08:42:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31F26C4CEEE;
	Tue, 18 Mar 2025 08:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742287478;
	bh=NJJzNTRDknJXLfROOfBbxIWmcgwRhNCep316udiZ8FM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dcjy9VLpm33mUCfRhkjxGfHVKu2TRRnc0L7RRFbXPRNp3r7sRwU+SGolTYvRgxad/
	 FwrYDkGR7UWaS6UxVNa7uaERBHjXdjuxmQRbP8c+eviscDzV3YuXIPRz8lPS6HTKG5
	 j6uKWvegpcFbDrSRVS5iivttq4ClLUl1OeUkF4jHtJ8wYcXkudUmHyg8tyCc+M+2ak
	 I7SCoHCE6aM6LTyiT6cMwfIybdESxIl5J1Q+8et1sTn+FcQm6+4tJAD163vJ6/STnD
	 qs/mAVThJo6P11hvsFWOnyermYuC+S+XHG/WeBWA+DZogl5w6QMgR3i9K6Kt2tDO+W
	 vm8+i7qKpm1kg==
Date: Tue, 18 Mar 2025 09:44:34 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rajaganesh Rathinasabapathi <Rajaganesh.Rathinasabapathi@amd.com>
Cc: devicetree@vger.kernel.org, openbmc@lists.ozlabs.org, joel@jms.id.au, 
	andrew@codeconstruct.com.au, robh+dt@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: arm: aspeed: Add AMD Onyx BMC
 compatible
Message-ID: <20250318-rapid-coot-of-tact-d779ad@krzk-bin>
References: <20250318041224.1693323-1-Rajaganesh.Rathinasabapathi@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250318041224.1693323-1-Rajaganesh.Rathinasabapathi@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_014439_396875_FC23A905 
X-CRM114-Status: UNSURE (   7.22  )
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

On Mon, Mar 17, 2025 at 11:12:23PM -0500, Rajaganesh Rathinasabapathi wrote:
> Document new AMD Onyx BMC board compatibles
> 
> Signed-off-by: Rajaganesh Rathinasabapathi <Rajaganesh.Rathinasabapathi@amd.com>
> ---

Where is the changelog? What happened with this patch between v1 and v3?

Best regards,
Krzysztof


