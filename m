Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55464CD4F3D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 13:51:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T5hUWqoBcetWurFLT+WqKkXg5w0LR6aXBSY+HmvYLjY=; b=WtTtH5SxphJlJ+4vqJZ/glFivX
	1mmTOsLX+3JLzrngHalZYmLmeRvuW+5pracq7zHxr4P0dMZYUYH49sKH3IZa6v7FuoHZ4g24WWHjt
	QMyrmboEqmzoigo3EpxVEz5ZGhsRgaVD6QlMVpzuYZHAtpFsl1aQh+ttfQ2rOjD0CETkmkC2mVMy2
	JRrCyISv21TlQR1MKJwbAS1vHkyumek8aOF3b26We9YxxtZTfbd3A2n1E2KzgZHRRf9XE5MjjkykJ
	Y5a4oIfGEWuH8Wb5OjoSB2/ptlX0UDUp2ybIcMQjxmZ/zuioh/yVoDf0B2N2QSh5yQ4yQ3iixXSNQ
	Paj6UWeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3nd-00000007x9L-0sKN;
	Thu, 21 May 2026 13:50:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3na-00000007x8T-2HI3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 13:50:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 807D640B3B;
	Thu, 21 May 2026 13:50:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F2431F000E9;
	Thu, 21 May 2026 13:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779371453;
	bh=T5hUWqoBcetWurFLT+WqKkXg5w0LR6aXBSY+HmvYLjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KU+L1bhnkhJo/MV32/XO49EHNota5MiSQTx1Oho3nvbRjIneiUuzV9T1KvRs3UzWv
	 POaTH4viRB4gKePFpkcdETzOTfHI4PQgQOegI1huOrOkyfb/s+dnBJvofHtIL+Pp/Y
	 kArxZHDsWup0p9xyM/dAJ8iH+GLxYL55pMPdj1e2WFPONwUtlzgB5b9mxTy41/so2y
	 JbmgvUgCk69QQLSBsGL+vVmi55Kt2NKPdNj07oUsgguhbnuzyA1Ny5LWrhnAjSIekg
	 gXOwKYvtCWzBfmfbT5Nd7yI4LSPrtF1zYv838vxPQgnQs9BDS72HRE91OQ8SvqnsdD
	 mz7aRlS0nPS0Q==
Date: Thu, 21 May 2026 09:50:51 -0400
From: Sasha Levin <sashal@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: patches@lists.linux.dev, stable@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 7.0-5.10] arm64: cputype: Add C1-Pro definitions
Message-ID: <ag8NuyPjvHmz8K5Q@laps>
References: <20260428104133.2858589-1-sashal@kernel.org>
 <20260428104133.2858589-51-sashal@kernel.org>
 <afCWPTqKxIqGPe1r@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <afCWPTqKxIqGPe1r@J2N7QTR9R3>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_065054_596512_14B2731C 
X-CRM114-Status: UNSURE (   8.68  )
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

On Tue, Apr 28, 2026 at 12:13:01PM +0100, Mark Rutland wrote:
>On Tue, Apr 28, 2026 at 06:41:02AM -0400, Sasha Levin wrote:
>> From: Catalin Marinas <catalin.marinas@arm.com>
>>
>> [ Upstream commit 2c99561016c591f4c3d5ad7d22a61b8726e79735 ]
>>
>> Add cputype definitions for C1-Pro. These will be used for errata
>> detection in subsequent patches.
>
>This definition is only needed for a workaround which is only applicable
>to v6.18+ (and the downstream android16-6.12 tree).
>
>We needn't backport this patch to v5.1.0.y unless there's something that
>depends upon it.

I'll drop it, thanks.

-- 
Thanks,
Sasha

