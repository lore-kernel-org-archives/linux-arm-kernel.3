Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4A4C36005
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 00:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qU/kdBnvGw724qMRPAszCiH+M5SkDycm6+uhIUmFJl4=; b=gFyoep8xwdWUEDUPPGnvItjlSL
	3yW8vJH2xaNuPtkNwB8lDyxnCE1qm9l+8WjUdrJhk6212/X8NgcjsoBWs6MZxSulC8CA4G48rndj5
	tjXXbT5fCJ/I5BbjDKVkzJj+2cQhCdW8kbRebzCPT0EAtV+E9SPMct/W0Skrml4Ogs/7pSda2Gc99
	9HmpASgYNCyeTx7EMvwTOEXSORW9uQ1CG2yw/gwbMH2JkPnqcggqa9rwIYW4+rZN6zjJFZnulwGKv
	2WWCzsTfHsyc/n/0AK2vJiyDpKM4Oe8BdGr27KcQY3X5wfg1Lz1b+BsHT2V3u6H7GqG3YvLBVnfAR
	oIqQlO3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txEUq-00000007IAK-1yai;
	Wed, 26 Mar 2025 00:19:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txET9-00000007I2Q-0QOy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 00:18:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CA07861126;
	Wed, 26 Mar 2025 00:18:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF32EC4CEE4;
	Wed, 26 Mar 2025 00:18:04 +0000 (UTC)
Date: Wed, 26 Mar 2025 00:18:02 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] arm64 updates 6.15-rc1
Message-ID: <Z-NHugcLdLqkEHFR@arm.com>
References: <20250325195322.3243734-1-catalin.marinas@arm.com>
 <CAADWXX-0hMgpyeQw_7Ko14hNMciqSnKJAROEWS5vwAdMKUt_zw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAADWXX-0hMgpyeQw_7Ko14hNMciqSnKJAROEWS5vwAdMKUt_zw@mail.gmail.com>
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

On Tue, Mar 25, 2025 at 01:12:45PM -0700, Linus Torvalds wrote:
> On Tue, Mar 25, 2025 at 12:53 PM Catalin Marinas
> <catalin.marinas@arm.com> wrote:
> > Please pull the arm64 updates for 6.15-rc1 below.
> 
> This was in my spam folder. The reason is that your email
> configuration is wrong, and lacks the proper DKIM signature.
> 
> You have
> 
>     From: Catalin Marinas <catalin.marinas@arm.com>
> 
> but it doesn't actually have the DKIM signature from arm.com...
> 
> It looks like you sent it through the kernel.org smtp server using
> git-send-email, but it doesn't have the kernel.org DKIM either (but it
> may be that kernel.org only signs things that say "From:
> xyzzy@kernel.org").

Hmm, I thought that setting "Return-Path: cmarinas@kernel.org" would be
enough. This header left my machine but seems to have disappeared in the
lore archive. Not sure how much difference it would have made, IIUC
that's more for SPF than DKIM.

If the envelope sender doesn't work, I may have to switch to using
cmarinas@kernel.org, at least for pull requests. Arm has an SMTP server
that doesn't add the legal disclaimer but I've had similar problems with
it in the past (the expected sender was ...@foss.arm.com; maybe IT fixed
it in the meantime).

Anyway, thanks for letting me know. I'll dig further.

-- 
Catalin

