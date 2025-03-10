Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACBAC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 18:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZoNaBqrH1Rg39yjdlkshp7UkEfEOBUaLHkBS5B1peJQ=; b=Bp4QeEVuvWaQPTpxhS3dT0/4d0
	m6h0Q4KR02y30NxeRz9Z1AxYwbPwEjLNzglKmwwZO/gXTCIX2oGH4tvmsfLmHJZzS3oqw0lUOCCnE
	dwkx8MZKSrv/rw764lwlEoQSbH/DaxOWHAwPl5kq0vANSU4cBfx4VerWm0DgFU17I4dA3K31jCwef
	yBQLlvL6uhl6ow5XOlahw+ltLjO/+qtlD4M7rIs5qeHRsts+oLzQlf2C617FPa4EfuNGQO9FMnktn
	4Cwg1v56zR/GOjNdCiQVlOxP0M15uT/m/3sSfFopsJ5G+ah6ILBTWuPVxV5M2tqeRVMyysZApzlHB
	irMUkX7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trhxP-00000003cX6-2BUP;
	Mon, 10 Mar 2025 18:34:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trhvk-00000003c9m-3V5I
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 18:32:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 57E725C5676;
	Mon, 10 Mar 2025 18:30:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7A01C4CEEC;
	Mon, 10 Mar 2025 18:32:44 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Douglas Anderson <dianders@chromium.org>
Cc: Trilok Soni <quic_tsoni@quicinc.com>,
	Jeffrey Hugo <quic_jhugo@quicinc.com>,
	Roxana Bradescu <roxabee@google.com>,
	bjorn.andersson@oss.qualcomm.com,
	Julius Werner <jwerner@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Besar Wicaksono <bwicaksono@nvidia.com>,
	D Scott Phillips <scott@os.amperecomputing.com>,
	Easwar Hariharan <eahariha@linux.microsoft.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] arm64: cputype: Add info about some Qualcomm Kryo cores
Date: Mon, 10 Mar 2025 18:32:42 +0000
Message-Id: <174163155801.3207598.4827401624809854495.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241219211131.2389091-1-dianders@chromium.org>
References: <20241219211131.2389091-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_113248_927303_C4958487 
X-CRM114-Status: GOOD (  11.41  )
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

On Thu, 19 Dec 2024 13:11:08 -0800, Douglas Anderson wrote:
> This series breaks off of my series that reworked Spectre BHB
> mitigations. Originally I needed Qualcomm Kryo IDs because I was
> adding "guesses" about their Spectre BHB mitigations. Now that the
> Spectre BHB series no longer has guesses I don't need them there, but
> these two patches still seem worth it to land on their own.
> 
> I've still called this series "v3" because the first patch was part of
> the v1 and v2 of the previous series.
> 
> [...]

Applied to arm64 (for-next/cputype-kryo), thanks!

[1/2] arm64: cputype: Add QCOM_CPU_PART_KRYO_3XX_GOLD
      https://git.kernel.org/arm64/c/401c3333bb23
[2/2] arm64: cputype: Add comments about Qualcomm Kryo 5XX and 6XX cores
      https://git.kernel.org/arm64/c/53a52a0ec768

-- 
Catalin


