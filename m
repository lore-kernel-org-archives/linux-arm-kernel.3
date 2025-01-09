Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134C5E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 09:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LQWYOhyxkRhwqf5D39Og/DMbsRpNczbkgUNckFGZrm4=; b=eH8F29hpveX0uo0Qor0rUqIS/+
	w12b5grh//XmMOUjegInqPjseQwVBAD0bZ3vDIZieMbJU1hCW+IKCV4X+5QXI6AJ4EAYeuBnaNm3g
	k2x1TEwaDYKTqX8Dhr/dkRjszM/ZnhLSCWZqpOU9pHj0mB3K53fRB5/L9cfkxexXrVZz+SQzgwFDe
	Oh4OQG3Ohb45jw+192Ip5puqZQQxSsjSaN1brXRbHsyUI0FZQ4y2qz6vgLx+EAqtiEe9AhoS6VSqF
	2JpGF9I/E5k6ZRFZNdAJUOQEaJgXynOwNRYrICtWq5QntPGnpujD6fv9eE14fJOEeU565Izbrk8jO
	0qRMByTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoh5-0000000BKTi-3YFz;
	Thu, 09 Jan 2025 09:19:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoeA-0000000BJQP-32cB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 09:16:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 62419A4145C;
	Thu,  9 Jan 2025 09:14:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD998C4CED2;
	Thu,  9 Jan 2025 09:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736414169;
	bh=pzEqprWkkcYMG76vFYKPLddgpbIGz3LDR25pymZL3/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S+PSqo3KRjIBEoxg904nsLlilQWiSShftgfV+29WmG5Z1q+9KeqQbnxoTQyuYYeDb
	 Em6ELRezNiejpVDuh/E5QBVRe+jfn23B8R2mgQUgfYD22WGiUzpyrct6z0LzmJ6CoX
	 A652jNunb0f53rPh0obn3SatGCJP7SzYJV6FyJoTdyhbtaJbyyFBhkjl+bbbnMTtnj
	 S4eX3TZ+4QF9vA5H3dxDbzg8K+2Z00SCJtuEBj8AJCjRQfvwZhkGc7V1zudegDsgHv
	 eZscj+A1oo0pd+nznLPOhIF1a4YHBbZZnNk9PaTwjiR+MIdHMsgT4KbaCF23luX77y
	 eOi4+EaikT2Rw==
Date: Thu, 9 Jan 2025 10:16:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan Brattlof <bb@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] dt-bindings: arm: ti: Add binding for AM62L SoCs
Message-ID: <qbyucnranctctrqkfc3uyuhhvvmseh5dpzoi3tlahq7e24kufb@w23tcbefjklp>
References: <20250108-am62lx-v2-0-581285a37d8f@ti.com>
 <20250108-am62lx-v2-1-581285a37d8f@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250108-am62lx-v2-1-581285a37d8f@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_011610_826762_2E7685FA 
X-CRM114-Status: UNSURE (   8.03  )
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

On Wed, Jan 08, 2025 at 04:51:53PM -0600, Bryan Brattlof wrote:
> Add the binding for TI's AM62L family of devices.
> 
> Signed-off-by: Bryan Brattlof <bb@ti.com>
> ---
> Changes in v1:
>  - separated out devicetree bindings

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


