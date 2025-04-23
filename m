Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29BFAC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qEUzMe1LF/DhAurj8l6HU0QMNvFgMl89P0LyypEiaKY=; b=TgPBpEdKtGomK9NCmJH7qt2Ue0
	QOXMCv/FIIDh2lPKqbk3pHucmAjAXZ4jMH15oKzfwy18eGf5rt1NAWmzOOeslUWEw99W3Ya56qYHm
	/hteW17Lc1r35JYiyLKE3CtXDuXOXB7DkYgCxgr+qj9h4tFF6cab9488t6kuVQ2XHNkr8+yEU5UWV
	yPzylVMjptkzZlHvTcgO0qS9NWJHljIbc5Io7R6C0Nbr5eKW+dJd2WoAt4zA1TqjGaD+7gGnYxgZ+
	fIkYhkrSAZ1SLYbkVkYniT70g5+RVZKTqMexQLn9ESXwJ572FO/bPx8WW/lczz6dIAypz5JjvvCWx
	2ANy6NLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e82-0000000BMdJ-0gJA;
	Wed, 23 Apr 2025 17:43:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7bzj-0000000Axmy-1MdH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 15:26:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B569C61569;
	Wed, 23 Apr 2025 15:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26523C4CEE2;
	Wed, 23 Apr 2025 15:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745421998;
	bh=byjfADMw7B0iAHcVOEL7w5089D7lAVY4aSDEd/Ylyp0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T+W1EKXqnhCHF1cMXIpgvpu7WEIPHWqZcKd3G5U64jxQc1jkX9B3Ek6iemKhWyaNU
	 flrC+9VLPkCtk3tm8RZHpWqN/udRUf4E4peak68etxvfs1/l5v7/KRgtX3M7C8XtWb
	 8+KIDk4Uqf8sj/U561yolbKjqOVZbxwsDzFKQovubEJbRljsw6qQ37GwbzY8mpfCmy
	 shByIRfT8dNQyqcSDwJLXp4ZrZ0rkP3H2YcXeplLPwcq7NX3U+XZ2OS1QNkaFPjG77
	 FhCAV+Gh6vbEfSWoGvlAK6XjiPKopDKA9JHzwc4Gh0erdTMOkFEpdLD3E0OltqywmY
	 Oc7FmZRhL88AQ==
Date: Wed, 23 Apr 2025 10:26:36 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Alexey Charkov <alchark@gmail.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: pwm: vt8500-pwm: Convert to YAML
Message-ID: <174542199611.553877.7404234278333094382.robh@kernel.org>
References: <20250418-via_pwm_binding-v2-1-17545f4d719e@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418-via_pwm_binding-v2-1-17545f4d719e@gmail.com>
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


On Fri, 18 Apr 2025 18:55:07 +0400, Alexey Charkov wrote:
> Rewrite the textual description for the WonderMedia PWM controller
> as YAML schema, and switch the filename to follow the compatible
> string.
> 
> Signed-off-by: Alexey Charkov <alchark@gmail.com>
> ---
> Split the series from v1 into separate bindings patches so as not to
> spam all the subsystems with unrelated changes, per Rob's suggestion
> 
> Changes in v2:
> - reordered nodes in the example same as in properties (thanks Rob)
> 
> Link to v1: https://lore.kernel.org/all/20250416-wmt-updates-v1-5-f9af689cdfc2@gmail.com/
> ---
>  .../devicetree/bindings/pwm/via,vt8500-pwm.yaml    | 43 ++++++++++++++++++++++
>  .../devicetree/bindings/pwm/vt8500-pwm.txt         | 18 ---------
>  MAINTAINERS                                        |  1 +
>  3 files changed, 44 insertions(+), 18 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


