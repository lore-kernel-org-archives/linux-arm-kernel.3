Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A765ECA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 20:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Subject:CC:To:From:Date:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=b7+Geox4ud8eTAeg3+j6HDt1q363PIIrzuBA/1qIzLQ=; b=TzOa+dBen/L6uGgikwRVbA65Yr
	Hf/bSvuO2Q8YR+iBta4Uam2hHrP+so25OpE8cSy2ZkjuRauBb6/51ZMWjRLlLzviKnZdOSwjPRXNr
	tamHsq/vIc5Ibpwx8y16/pfs8v5ovPnZjpmxw3JOqvlp7y4aAzFauvPje3qgV6a2BYTTKbbyVuX72
	lyBkBVJfNDKRX1cbI2QT4w8U8rQLZZu4Hikr835DqyVudxlJpzPC0Ghe+ntyppFRncr9GyvlmJrS+
	y8HN3vOVAxsoDmNdI0uSv8ylaNxK0yg6vPCaV2RRV+u7+RyMajsHDtXRqWfKD5aNrmhvXyZA4vHmo
	6LXDN0dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBeFi-00000004SGk-1135;
	Tue, 29 Sep 2026 20:16:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBeFg-00000004SGU-41hb
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 20:16:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:In-Reply-To:Subject:CC:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:References;
	bh=b7+Geox4ud8eTAeg3+j6HDt1q363PIIrzuBA/1qIzLQ=; b=RKOhL2kjpjN9NFIJDA5eU4ZBGf
	kbua9rH1go9gUFUIAgyCKpFwoykYoHegvS0O063aHEp4K21HL3vCtmXw+NQN7iVG/7lkSFiBD+qGF
	BMLug7kvABc14/gNot4dyaRqjYWFmRNpq5mgYK0YpHQ/fsQGsaAaz+2PNSCFlJVQvQz6TeCffE4Ft
	x7+ErrEQNBUjmxIDiGfJSLwHzBo2J0V73N3PPJF+ZkEKqgQt4ES+tnXCfJ2K9Fqv+DRgOVrl9eYA4
	wi3VP0W77Fojoy2Ql+aG9wufvnzrMuKvLkUzSiIPC63T9e9Of3VPzkbI72RXXrJyKt+xbccyXf+Mm
	V7ViCPNw==;
Received: from mail.mainlining.org ([5.75.144.95])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBeFd-0000000337q-303r
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 20:16:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790712967; bh=b7+Geox4ud8eTAeg3+j6HDt
	1q363PIIrzuBA/1qIzLQ=; b=X1QmKbvMB/5s7XUVbyfZ31NXs8eN1HR6bZAsQJYyBgls5geHeO
	sxI/uPI9qD7AR+GKtCZ5k0FB4SVA9kiOS9XmfDxyjlDIl110WbhLYe+MbwCQaOPngaEqrr6gHRq
	9DlZC9X9rBG/te3HSZCmWQaac0Ox59h8ThThKgHiCs6/EB0YTao+y7mQGfIq0RZDz3P4Qe89BcW
	mGsJ7i0WAFTYXsQRnDb2XJKLCHcW2gqTfth0EobSiwVJXQ3YvLBB8suTMN7AY+dZtvIJ253inVY
	hqS1QLOERfjIwMOm5fOawvoxOOrYto1fDGTogs+fJDQwERF7NLRQdby3Gjilcfd/VGA==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1790712967; bh=b7+Geox4ud8eTAeg3+j6HDt
	1q363PIIrzuBA/1qIzLQ=; b=aohXBJhkdcn4jNAYTeUiUJaqenky18FS9eaOv/ZDLdn1loHoQG
	MatyD7zBmVYyUXu2TorED2ACCUri1NRjKjBQ==;
Date: Tue, 29 Sep 2026 21:16:08 +0100
From: Bradley Morgan <brads@mainlining.org>
To: salil.mehta@opnsrc.net
CC: catalin.marinas@arm.com, corbet@lwn.net, gshan@redhat.com,
 james.morse@arm.com, jic23@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 mark.rutland@arm.com, peterz@infradead.org, ruanjinjie@huawei.com,
 tglx@kernel.org, will@kernel.org, yangyicong@hisilicon.com
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_1/2=5D_cpu/hotplug=3A_Sk?=
 =?US-ASCII?Q?ip_disabled_CPUs_in_cpuhp=5Fsmt=5Fenable?=
In-Reply-To: <4ca071f1678acd1d3b8ecc0266938f59b45f629a.1790692295.git.salil.mehta@opnsrc.net>
Message-ID: <133D63B7-B1DF-4DEB-92F6-B6D785D43457@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_211633_974417_8BF8730F 
X-CRM114-Status: GOOD (  11.98  )
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

On 29 September 2026 20:41:29 BST, salil.mehta@opnsrc.net wrote:
>From: Salil Mehta <salil.mehta@opnsrc.net>
>
>The CPU enabled mask describes whether a present CPU may currently be
>brought online. cpuhp_smt_enable() is an online operation, but currently
>walks all present CPUs and only filters CPUs that are already online or
>belong to offline NUMA nodes.
>
>This can make it attempt _cpu_up() for a present CPU which firmware has
>not enabled and which has not yet been registered as a CPU device.
>
>Use the enabled mask for the policy decision it was introduced to
>represent. This keeps present-but-disabled CPUs out of the SMT bring-up
>path while still allowing registered offline SMT threads to be brought
>back online.
>
>Present and enabled are separate generic CPU states, so callers which
>intend to bring CPUs online should not assume that every present CPU is
>enabled.

Ok.

>
>Signed-off-by: Salil Mehta <salil.mehta@opnsrc.net>
>---
> kernel/cpu.c | 5 +++--
> 1 file changed, 3 insertions(+), 2 deletions(-)
>
>diff --git a/kernel/cpu.c b/kernel/cpu.c
>index b3c8553d7bd6..988b7a1e8298 100644
>--- a/kernel/cpu.c
>+++ b/kernel/cpu.c
>@@ -2706,8 +2706,9 @@ int cpuhp_smt_enable(void)
> 	cpu_maps_update_begin();
> 	cpu_smt_control = CPU_SMT_ENABLED;
> 	for_each_present_cpu(cpu) {
>-		/* Skip online CPUs and CPUs on offline nodes */
>-		if (cpu_online(cpu) || !node_online(cpu_to_node(cpu)))
>+		/* Skip online/disabled CPUs and CPUs on offline nodes */
>+		if (cpu_online(cpu) || !cpu_enabled(cpu) ||
>+		    !node_online(cpu_to_node(cpu)))

Ehh, have you had a issue with this code? Like something e.g: a splat.


> 			continue;
> 		if (!cpu_smt_thread_allowed(cpu) || !topology_is_core_online(cpu))
> 			continue;
>

--- Thanks!
"I'm not a very positive person" - Linus torvalds

