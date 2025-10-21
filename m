Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 398D5CCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 02:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bsTqYwg58cyd1pl6rTIsOi1W75+O+jlwWVAjs0i8EeA=; b=Emhqp9Qsn+iio9DJLjeF+AzxBc
	t0uhJXaC3VI4nyMgotj3TNdir7P90qJuM5Na1/4iHiMhrvbaEIIiKZGxCIViCKOj37Zu8ab9iXwte
	UXJ7X4IVf0sbfcsvdbMelCvtZeJp9J/swBKGyE/YTmtfe2A08x57ZJteWnzcHHnB47J8Ay2WwU9Os
	euwumJdiXdNBU276QTVJF2Jsg28YM4SvHzkrEglja8ytJ4Ev3vODhfevtyoBU4sV8lz8XldETCovE
	+5B0Hx8WqB2PIP36pwkXrrOm8qzAFhKAcG2sTiXOXcRfuhgY3oYw35l8NftwxVijxryMELl8gH6Rs
	1wPE82tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB1xe-0000000FYQE-33DV;
	Tue, 21 Oct 2025 02:18:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB1xe-0000000FYQ4-02iV;
	Tue, 21 Oct 2025 02:18:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 20EA260349;
	Tue, 21 Oct 2025 02:18:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2908C4CEFB;
	Tue, 21 Oct 2025 02:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761013118;
	bh=5hmayQpWFEnlj9lk15TbX3e+RKDmLihg12bokDKp9ZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pbm/pwjftMIp/AwO4wvL4bYMwnvwdXZiWczqSa3upKmlJZ6/uXV0+HrI3U5lILK2J
	 fg82t6Qb7Sn0htJIqHVw8z3SPxsHqZEiLuo+YzhtT9dVPW+uV+4Y1iuUcgZw1WrlwA
	 YemqlRHFcbXAU8jv0/Pe0vZrprw9drHIBYxK3ToPC8X+BZHuCSRPaDGqoGTQZJEiQC
	 kENCOpUNYtNbyZ5O3Acu/u2La9pX9uSKE96aCBnwhn+aDb0vmL0Huy9FVA4lof1fN8
	 9MAqrG4R1amC8DhJg0hWEFkwzlysOy+qibWYmjMyLbVabNJgTvchfsy9ucRtKNzuNv
	 QMLi2umTaU0tA==
Date: Tue, 21 Oct 2025 07:48:29 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "Rob Herring (Arm)" <robh@kernel.org>, 
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-actions@lists.infradead.org, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: pinctrl: Convert actions,s700-pinctrl to DT
 schema
Message-ID: <3br66j7ghxg3yegzrlc4fpvfv5ttkjrlqtc624mmnuixre5pnn@gsnugcnk3c3l>
References: <20251013191207.4135075-1-robh@kernel.org>
 <CACRpkdZDM8zMtuPQ6rQQ+TZhz4bAYOepeETVQ34_MfDYx0LMmA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CACRpkdZDM8zMtuPQ6rQQ+TZhz4bAYOepeETVQ34_MfDYx0LMmA@mail.gmail.com>
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

On Mon, Oct 20, 2025 at 10:55:58PM +0200, Linus Walleij wrote:
> On Mon, Oct 13, 2025 at 9:12 PM Rob Herring (Arm) <robh@kernel.org> wrote:
> 
> > Convert the actions,s700-pinctrl binding to DT schema format. It's a
> > straight-forward conversion.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> 
> No comments for a week so patch applied.
> 

FWIW,

Acked-by: Manivannan Sadhasivam <mani@kernel.org>

- Mani

-- 
மணிவண்ணன் சதாசிவம்

