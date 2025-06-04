Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EAF9C5B555
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 06:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dxK57rrh1jvoo1g24molYIQ1YbfbH2OZpE0y+PyiV/c=; b=FGG7cIcrNyPhIBord/72irvDAd
	7yjEzg76CXIYtOVrvrHQq3+LEDnQyCr5tmuo7uHgduKHRGz5qUdLzC1y6ceODjwXYmSGZaedEF667
	HW/Cxv4bM2Ke/zyWYC634st7IOzXJYsSUnci3q0DL+sNPvY+i65qsRD47fzjO+7xuUico8pFFTfFf
	Um5+Kvxzdw3nXlgnfcLgiq+Tz5jyi0ApJCzUrEKHW3n4mnVox5nI2heMubSZcYsOE/b2r4bKwfWh8
	MaisYIIcPPrOs2PyLuk0MVkfi2py7xhXoMCQ7PeHnWkbh+5XNoC/Eu/86sKcZyCwJDePzCtjVTwRR
	ULQcDVXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMhDE-0000000CeqC-1vD8;
	Wed, 04 Jun 2025 06:02:56 +0000
Received: from out203-205-221-173.mail.qq.com ([203.205.221.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMh9C-0000000CeM4-2RVd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 05:58:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1749016414;
	bh=dxK57rrh1jvoo1g24molYIQ1YbfbH2OZpE0y+PyiV/c=;
	h=From:To:Cc:Subject:Date;
	b=j8EUBg02aEnilOpHZCWkZ0BRObtR1z8LLex8B0Nmvp5bywuBr0tqIFXqpgqtUN+Ek
	 DWPPmbKeK4FnK0LlnspTPyYrY9B0PEtfBFOqyuVCiSacdCNh6hpkMGmiTvADD9h8hR
	 R5EBvV1PNxaxflrmWghZzuC5hKu64CLZQWydpB9o=
Received: from NUC10.. ([39.156.73.10])
	by newxmesmtplogicsvrszgpua8-0.qq.com (NewEsmtp) with SMTP
	id D5E8A2A8; Wed, 04 Jun 2025 13:53:30 +0800
X-QQ-mid: xmsmtpt1749016410tl4fl36g6
Message-ID: <tencent_A6502A28AF21A3CA88B106F3421159869708@qq.com>
X-QQ-XMAILINFO: NQzH8pzEc5hGPs3uj3kHrPeahZXak4dASrsyrlzi8+3SJ7ZOTDpWGr79QAvJA0
	 fhuR2sbv+Msr+YEK+VIb74pqi2uxdzWNu1OdHXfeB+gQ03Su/LZcBfmkwasrzX9FYuUnQXit9C+8
	 0IGhc4QLAqbKjZD2amrQ9T+2pXDPAHE6zE9GoK//b4lUK7qCg59+iZvbfFjqbiBHo2ENmXdEPY9o
	 zCcyfK05WmOKNR16Gm10Z71NYlowvtf8olaxSsExCHxDWghK7mKS53Z0w1Zlidk+iXMa/C4XQCiy
	 3PtbVLIPiynLUyTUW/WJrl/7CuVbUIpWgTYSdKL2pqwNrw/tDpSXOQ1hw8QsaEC9qQxeM4siDjic
	 xO5BKctg33BahoFO/o11+aebzWKaRomZaU9YeqRZILrG8rtEGKIjvpnFbIUvnHFq5qKCaV/1g9CE
	 b+Tvda3WblLyGp5R4B1ybfjTRi7bzLIhcObdUeogv0Ovz6nBlKdAlkhDlk/7TzI+JgLq0urLwHZn
	 Bd9mfje5NdZvG0aBDfd3HsARwebUUxi79N7F1hd+64PcRbaGV3qtIpaCdA6jwIHWOSb/VvXsf3Xq
	 2IIeq/+33mu/I7IkCFknTgMP3obpfF8b6sR+EIZJfYDoRArzXNZcHoZUv/2RgZ4mWUUvtu4yLLBQ
	 AML7h0BY4RTkSoFxrTSd5U0M4q0xWbywZiDdrTcKkLGDH4a8DZ0kJlCf2dljGbY0+QrBDnGbLd7U
	 YrdmJeSInyQ/AiQwoj5qfElxvyst5HOcko0dhXHeacRUWEDDbeEXzm5w5+s7gzq8AkXqMZqt1nKK
	 gawqU30CpqXDpEHnLpgGZ+tmOIklp4yY8TCXhdfQ9i1gjILJFTDL4EQZoLUrF26XXA8SGgzGoY9G
	 5SIOqn0KAkov8Plr9prRgfZzXXi4meZrkw/iUdPHs+vY5gdNQTZiakfZPdradkPBZ75gVmMfQ+fG
	 mzxismGJH8a23K/56wMcUloUA3OxUmqFqRJc0tai9nrTW5oqwHvx/QQNkfGv28p3VR+OPlF3U=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: Rong Tao <rtoax@foxmail.com>
To: andrii@kernel.org,
	eddyz87@gmail.com
Cc: rongtao@cestc.cn,
	rtoax@foxmail.com,
	Mykola Lysenko <mykolal@fb.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Amery Hung <ameryhung@gmail.com>,
	Juntong Deng <juntong.deng@outlook.com>,
	Oleg Nesterov <oleg@redhat.com>,
	bpf@vger.kernel.org (open list:BPF [SELFTESTS] (Test Runners & Infrastructure)),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK),
	linux-stm32@st-md-mailman.stormreply.com (moderated list:ARM/STM32 ARCHITECTURE),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/STM32 ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH bpf-next] selftests/bpf: Fix compile error of bin_attribute::read/write()
Date: Wed,  4 Jun 2025 13:53:22 +0800
X-OQ-MSGID: <20250604055324.222850-1-rtoax@foxmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_225846_922993_9ECE5D40 
X-CRM114-Status: UNSURE (   9.95  )
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

From: Rong Tao <rongtao@cestc.cn>

Since commit 97d06802d10a ("sysfs: constify bin_attribute argument of
bin_attribute::read/write()"), make bin_attribute parameter of
bin_attribute::read/write() const.

Signed-off-by: Rong Tao <rongtao@cestc.cn>
---
 tools/testing/selftests/bpf/test_kmods/bpf_testmod.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
index e6c248e3ae54..e9e918cdf31f 100644
--- a/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
+++ b/tools/testing/selftests/bpf/test_kmods/bpf_testmod.c
@@ -385,7 +385,7 @@ int bpf_testmod_fentry_ok;
 
 noinline ssize_t
 bpf_testmod_test_read(struct file *file, struct kobject *kobj,
-		      struct bin_attribute *bin_attr,
+		      const struct bin_attribute *bin_attr,
 		      char *buf, loff_t off, size_t len)
 {
 	struct bpf_testmod_test_read_ctx ctx = {
@@ -465,7 +465,7 @@ ALLOW_ERROR_INJECTION(bpf_testmod_test_read, ERRNO);
 
 noinline ssize_t
 bpf_testmod_test_write(struct file *file, struct kobject *kobj,
-		      struct bin_attribute *bin_attr,
+		      const struct bin_attribute *bin_attr,
 		      char *buf, loff_t off, size_t len)
 {
 	struct bpf_testmod_test_write_ctx ctx = {
@@ -567,7 +567,7 @@ static void testmod_unregister_uprobe(void)
 
 static ssize_t
 bpf_testmod_uprobe_write(struct file *file, struct kobject *kobj,
-			 struct bin_attribute *bin_attr,
+			 const struct bin_attribute *bin_attr,
 			 char *buf, loff_t off, size_t len)
 {
 	unsigned long offset = 0;
-- 
2.49.0


