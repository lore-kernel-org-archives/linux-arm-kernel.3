Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C369CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 06:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fpwXJPMyON2eWtQYaGV+3QNAbVJ3mx8rU5QiQ/o+uTc=; b=zBIVAxrWXdjjbwNzzc/U0vvcez
	uKOIN9wfBMrK7prI7mmQ5e+H+xDiWjCCrhs0+r0hes57DaymzaQqUg/enNOjOt22GsWeMxIf85CAH
	cp2DtfYDyeO4E9XPBMwoxj9z27StNapqEY6ohNa932SLgs38nmENrOT1ZvB5jcgcycUqotXNOXAdn
	zlbOwkAvguh96pnoquwF6KnnwlCD9k6NA66Jv+8VbnJE7exTKWlN3JOXQUrgxiN7W1J54KxYPvdH1
	9zXQX5Z+1pn+DW05dfvJ2cKISeqcI6wgMYByxSbu0zsrw/1ruzy91CiS/4WlKwFCm/lAKGAwtnQUy
	yH0zVs1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOrhl-0000000ESre-3hdE;
	Mon, 18 May 2026 06:43:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOrhl-0000000ESrO-00IK
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 06:43:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=fpwXJPMyON2eWtQYaGV+3QNAbVJ3mx8rU5QiQ/o+uTc=; b=FirhsM4HvYNFY8bG1Yw1FJuv19
	IUP6g+aS1DW4PEMrGKGKRGszV0UHPxSuhFQKV/WWUKOa6KXPeKUzrC3I4bymTb8vw+XirRPvW+jFG
	gBCwS4KmxDZkmrr/RD+g0hRkqpWT9mMQiqfSGsU+Iockcz2G/lffVy8zgcLpRBGdqsOr9AZ5M1z3S
	TPqmAo+EYLN8Kj3/k/qsq1GS8BMsv1hwXzCJM5j82qAHOzqpAKft8KzybGmrjMmoJqgvA6fP4I8gP
	4tKDjHj/Y7ISLIajOsTA5obwmxVBwDBjRzEvKZt55O7KIwgIywerfX0DjHFkFwBo0gpxZc3763yYu
	3Y3rBhXw==;
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOrhX-0000000A3lf-2G89
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 06:43:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779086612;
	bh=fpwXJPMyON2eWtQYaGV+3QNAbVJ3mx8rU5QiQ/o+uTc=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=S4G57EjkcItjKyOzc3wgqcYj/W7Jo7P+GnbppqCtdkLgNfDi1vkxrbwp1Bb8Vab1W
	 SkXGY8ZpyeKHuKnxhe28E4OvWuRt/db/18611N0GszPw3yvhwKKCSfRfBOUnbFsQV2
	 O9ItcIMHLzcaaL4DQnwGUJlIDi1Wl/BEvLnXuq2j4/aFsitYa0GDObxG1NzaItARcP
	 XfwOM9fFLZqW+yHYAr7E8AGtqVHiEwdeT7YisxZdup1hxfbn1QLt4JGrwKz4aoIL5t
	 S08G5m++8iqp8mTALV4VIyxX99nLuZ0wucRteEnMmfTTDF3jdgvyFIcQ6l+jKfgnb8
	 ex90ei2OG2wqw==
Received: from [127.0.1.1] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id EF63F6025D;
	Mon, 18 May 2026 14:43:31 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Joel Stanley <joel@jms.id.au>, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260505102635.160772-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260505102635.160772-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] soc: aspeed: Move MODULE_DEVICE_TABLE next to the
 table itself
Message-Id: <177908661185.1619049.12663504861396932958.b4-ty@b4>
Date: Mon, 18 May 2026 16:13:31 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_074344_621279_47AC4AB1 
X-CRM114-Status: UNSURE (   7.91  )
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

On Tue, 05 May 2026 12:26:36 +0200, Krzysztof Kozlowski wrote:
> By convention MODULE_DEVICE_TABLE() immediately follows the ID table it
> exports, because this is easier to read and verify.  It also makes more
> sense since #ifdef for ACPI or OF could hide both of them.
> 
> Most of the privers already have this correctly placed, so adjust
> the missing ones.  No functional impact.
> 
> [...]

Thanks, I've applied this to the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


