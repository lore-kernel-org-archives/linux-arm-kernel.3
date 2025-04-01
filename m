Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AF14C36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 06:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N5amiGWhYVQiNjDf80v1j76SUYJp6QIkQ0jjdsqkwu8=; b=ZsMAsXlPBbbhL1yIUtvpBKDwAI
	6P1DqFXRAHsTw+GZR3QXHd+GrgKaCwAGqKTGwtVb7xrkv+b+Nc06QMy9XOiyP5RCWVRmMU+RoTAQt
	JLh7f7gWqiJb8KI/9YymtmG466lvFSrbnNClUowB9wemc7w5A6APZz3xqxhjDgTyWSBE7ic+HUWEB
	Kgc76cI5Sxk3wlxj9tYdqW7clp3rx4O7RTiACmnDJDWxyuIwFsdHG2/slR4oWp7E+mM17PuSruvt0
	CmZikqhLp0CM2awveFjQbo1aBV1FHmMA8mh1nVB3jZ9IUFF90WpYULY09QQ+Y+Lll3laIE2Q+eiCa
	MvwTLP9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzUxz-000000024t9-0Oxf;
	Tue, 01 Apr 2025 06:19:19 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzUwB-000000024e5-1vrD
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 06:17:29 +0000
Received: from localhost (unknown [124.16.138.129])
	by APP-05 (Coremail) with SMTP id zQCowACn3wfchOtn05WcBA--.19358S2;
	Tue, 01 Apr 2025 14:17:02 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: andrii@kernel.org,
	eddyz87@gmail.com,
	mykolal@fb.com,
	ast@kernel.org,
	daniel@iogearbox.net,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	shuah@kernel.org,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	peterz@infradead.org,
	ameryhung@gmail.com,
	juntong.deng@outlook.com,
	oleg@redhat.com
Cc: bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] selftests/bpf: Convert comma to semicolon
Date: Tue,  1 Apr 2025 14:15:46 +0800
Message-Id: <20250401061546.1990156-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowACn3wfchOtn05WcBA--.19358S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KF17ur4DKrWUZF4kWFyrtFb_yoW8Cr47pa
	4fXw1DAr1xJa1UJa1xKa9Fqr1S9rsIq3y7Jas3Kr93Xa13t3W3XryUtr18twnxXF4rXa15
	uw1YvFyv9an7ZrDanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBj14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E
	8cxan2IY04v7MxkF7I0En4kS14v26r4a6rW5MxkIecxEwVAFwVW8AwCF04k20xvY0x0EwI
	xGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480
	Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7
	IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k2
	6cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxV
	AFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRzMKAUUUUU=
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_231727_883506_96F74C4E 
X-CRM114-Status: UNSURE (   9.17  )
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

Replace comma between expressions with semicolons.

Using a ',' in place of a ';' can have unintended side effects.
Although that is not the case here, it is seems best to use ';'
unless ',' is intended.

Found by inspection.
No functional change intended.
Compile tested only.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 tools/testing/selftests/bpf/test_kmods/bpf_testmod.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
index 3220f1d28697..f38eaf0d35ef 100644
--- a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
+++ b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
@@ -1340,7 +1340,7 @@ static int st_ops_gen_prologue_with_kfunc(struct bpf_insn *insn_buf, bool direct
 	*insn++ = BPF_STX_MEM(BPF_DW, BPF_REG_6, BPF_REG_7, offsetof(struct st_ops_args, a));
 	*insn++ = BPF_JMP_IMM(BPF_JA, 0, 0, 2);
 	*insn++ = BPF_MOV64_REG(BPF_REG_1, BPF_REG_0);
-	*insn++ = BPF_CALL_KFUNC(0, bpf_cgroup_release_id),
+	*insn++ = BPF_CALL_KFUNC(0, bpf_cgroup_release_id);
 	*insn++ = BPF_MOV64_REG(BPF_REG_1, BPF_REG_8);
 	*insn++ = prog->insnsi[0];
 
@@ -1379,7 +1379,7 @@ static int st_ops_gen_epilogue_with_kfunc(struct bpf_insn *insn_buf, const struc
 	*insn++ = BPF_STX_MEM(BPF_DW, BPF_REG_1, BPF_REG_6, offsetof(struct st_ops_args, a));
 	*insn++ = BPF_JMP_IMM(BPF_JA, 0, 0, 2);
 	*insn++ = BPF_MOV64_REG(BPF_REG_1, BPF_REG_0);
-	*insn++ = BPF_CALL_KFUNC(0, bpf_cgroup_release_id),
+	*insn++ = BPF_CALL_KFUNC(0, bpf_cgroup_release_id);
 	*insn++ = BPF_MOV64_REG(BPF_REG_0, BPF_REG_6);
 	*insn++ = BPF_ALU64_IMM(BPF_MUL, BPF_REG_0, 2);
 	*insn++ = BPF_EXIT_INSN();
-- 
2.25.1


