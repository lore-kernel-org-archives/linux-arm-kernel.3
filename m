Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3FFECD3438
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 18:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46d2WKqB4QivNdSOih812/FgAVdrOhMqfB2zRyzbfkI=; b=GXYYvJOlFSoItFVH5JmGBj7GeV
	J2PQtt06Xa9E3eiasG/OtKaihsZwRKVWUYLy8GZIihBEyI+/P9w7vVjrP2xzZF+0ZMgNAItsQgotn
	CFXgUofQxoGEVn8DkQwljhBz3J6FN4rxCXSU23KysCXtV0+87JEBgRPfWxUtUKarYpdnX4gJLw90J
	rBjZZ7TE56OFtJ7jB1J/qiq5LxenlZtNOnQK8qKpRC1kzhxQ3vDDX3uNf4fBsY9+nm4LaIMOV9SDH
	hxBe1UUPhve/o1EFHjhomqL8v5BJDJvwQcZWI3kf7O3/+W4cF9dmhxkLyy10Njds2nSF8hxqFwVSg
	yMjEL4GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFeh-00000009MQE-3PVk;
	Wed, 12 Nov 2025 18:33:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJFef-00000009MPb-0UAM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 18:33:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6591840A6D;
	Wed, 12 Nov 2025 18:33:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05000C4AF09;
	Wed, 12 Nov 2025 18:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762972396;
	bh=YaM4MitBaEoWYE2OAO4lEQ4UZhqNzLI+jlRBaovkzmg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hoXrSCZS9Xf3fBk2X+DXNK8EP3lPIENztViVu3zCYEb/92xGlmw1je8RnrgQHKPut
	 f2/vW474pdSQZbkzFol/e0IrvRm2QZOlbxlQ72NQZyOJCrHwErPjOb1y6ARFmgdBM9
	 HVRo5UDuOEZT2Mju3v+TcGJqHJEx/j2zTu7Ad14+wormbA5LhfTG5jRka7PO2Wg9OA
	 o6L3Vy4ZPldDQldQXxcj1D4dX0EP1hP8tUHh/D5g3IJsJkzwTIXxlo87rqBBbkHcRC
	 b/aNs2Ha02pL14WnO8vO92lPNgR5pAkwrpDcF8E1E94ZqGoyKF/jHgybtZCS7bV0ea
	 /evGeUraqX40g==
From: Catalin Marinas <cmarinas@kernel.org>
To: rostedt@goodmis.org,
	mhiramat@kernel.org,
	will@kernel.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	Bo Liu <liubo03@inspur.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH] arm64: Fix double word in comments
Date: Wed, 12 Nov 2025 18:33:00 +0000
Message-ID: <176297238094.2053466.1065029098279843692.b4-ty@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251029071742.17732-1-liubo03@inspur.com>
References: <20251029071742.17732-1-liubo03@inspur.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_103317_173461_2A9555B3 
X-CRM114-Status: UNSURE (   5.72  )
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

From: Catalin Marinas <catalin.marinas@arm.com>

On Wed, 29 Oct 2025 15:17:42 +0800, Bo Liu wrote:
> Remove the repeated word "the" in comments.

Applied to arm64 (for-next/typos), thanks!

[1/1] arm64: Fix double word in comments
      https://git.kernel.org/arm64/c/337f7e3a4b4d

-- 
Catalin


