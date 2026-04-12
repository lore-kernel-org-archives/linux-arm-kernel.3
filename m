Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4646EE64009
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Apr 2026 09:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DL0ByLOkBN0eP5odjaG+Q5ZlRVnRBNpGY49zguy4ZMg=; b=MHpoNnqXY9Ps6XE92nwwvB5PUV
	aX0m/aH2KJinlPn3sAJ9EoQ/7uQV98J+uzFmC1LwQa4mGRsBjdL+UT7TN4nFZ4Z1OCuXzhlP/n0Ov
	d3xgoNOwfVQv04V5AdRyaZwZiDx1PQhWtpn1vvtnQVHnJEL3eblnG9OU164YB7cF0hVavd0RY57Le
	K8FfActK83c6cPHucG9Ptr/QO067ITkoTre1xNiCNHGBIluLbwjUcwjSRqKqOTj+dL0T4RPGV4OhB
	Oc5D4XRov+nWZA8t0mu36b7tDjvbHpHUFCYPW54XP2jZ4WYPJLOXgEqz8zveGqMTMEy2zhPix2QA6
	8bQw58uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBrSa-0000000EDYq-2Ndp;
	Sun, 12 Apr 2026 09:50:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBrSY-0000000EDYW-2Gdc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 12 Apr 2026 09:50:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0075D4027B;
	Sun, 12 Apr 2026 09:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C850C19424;
	Sun, 12 Apr 2026 09:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775987427;
	bh=7YqcioY9WuxgKy+2v9DVxJV8vkXH4+kS7HY6Sw6vedw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sPrt1eWtc/X5I7Z7uguicd/tj427Yx/h/GftaPRI8Vvr7PmTlXgj+IBp7nwJC+g6l
	 13Vc41QwolZf+VpFGxV/WcyXkS2ORIIPU/ZntXXq/ficMzVfCd49TVwZl9sYvmOOAi
	 ljsFl1hvpV9c4fhvS398pnbCUOkiGstPqE+zpl8YStxxb79ivW8G7tT6jUjLCcNHCv
	 LZpJ2RiXISAavepNncNF4WtaSISYGnZr/LKxQGD0OxTlCktRYw3GfX22MYh5NZMRaR
	 trLwwgXhf0x5hAu3LzHFNTdVKsIFkSgl7BlapehR2UbpFInPQdtD6NP66bLdW2OVYs
	 7NkD916p/5Kkg==
Date: Sun, 12 Apr 2026 11:50:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Khushal Chitturi <khushalchitturi@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	liviu.dudau@arm.com, sudeep.holla@kernel.org, lpieralisi@kernel.org, 
	pawel.moll@arm.com, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: ARM: arm,vexpress-scc: convert to DT
 schema
Message-ID: <20260412-hog-of-splendid-intensity-84710e@quoll>
References: <20260411183355.8847-1-khushalchitturi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260411183355.8847-1-khushalchitturi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_025030_606750_FE369895 
X-CRM114-Status: UNSURE (   7.03  )
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

On Sun, Apr 12, 2026 at 12:03:55AM +0530, Khushal Chitturi wrote:
> Convert the ARM Versatile Express Serial Configuration Controller
> bindings to DT schema.
> 
> Signed-off-by: Khushal Chitturi <khushalchitturi@gmail.com>
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof


