Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF963606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 23:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=H/6wjhGz;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=GfXf1IO4;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BquDL5dp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gSxjo7G/C4iKFeABmyD/cOIF2FiAgdOm/dXL8y9CJck=; b=H/6wjhGzItwt31
	cpeaFT9BnXIsJ7re+/FKkMJARG9hbmCAKhtwXAdRYhWoNmmyIgC203DluyB4DCMa4ahx1nCwfKnDt
	+4Xr4EX5SzABgMZVQbTmqvDOhQ3PRlKfrDi4QsvVnpW3CQvW1wYnBfzZHFdWBRfRy8cTkhucU4ieh
	RchxJH93hUY1tNlpftEuwXrOk3m9KaXaZr0jCaT9pI0xIAp57qNPvHxZH+FD6VLtswWjp8PPb9Nrv
	sQFAT8peeRH0+cGr9AkiXdSIGIIbVPdNhEgllRlfJ8xQ4nuS+rmIXn7zC3rsiSY1TRv6Md5hixxOi
	Ne844t32m8jDqv1ozvAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1An-00000000cEH-43Bm;
	Mon, 02 Nov 2026 23:10:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1Aj-00000000cB2-3j43
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 23:10:39 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K6M3e1301304
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 23:10:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=gSxjo7G/C4i
	KFeABmyD/cOIF2FiAgdOm/dXL8y9CJck=; b=GfXf1IO4G333Kn+mISHKagwfJvd
	jg3ziOgrRSmF8W7h2zp2MNPIJ+jghNIW0xLXDO2Fm2KQEhyfls2jx7N2Gf9WN/xW
	ApZxRo7/gdXbngf9TjMw0ixVNCVdVILFFDEDszi8zFzfyD/krL9ZvqLVYEU21yAB
	d75JRXcPSS3nCeAs6VvD5k+4R1RtqKaxTs3GuXauJSL5nvwNS2/95tRbod2sRziP
	Eo2D2L8gT4OjDt9Rg2g5S7F4LaumsKcBsWFTBHtPaKx0knAikw3sGB6dxdbxl8zm
	o3ZSKnIWUKFg5qakEtjA7jfkCqYLb0Mlg1+w1+rAWRZe3j4YHpUi/yQ8eyA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpsa6tu9y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 23:10:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93ecdc701a2so410944985a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 15:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793661036; x=1794265836; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gSxjo7G/C4iKFeABmyD/cOIF2FiAgdOm/dXL8y9CJck=;
        b=BquDL5dpQrvLSUbwtsIAtPpmxkAPSPy6r/6hVCNNCbvKONzIy9jvVFnOgULEP73W/F
         Wo6Bji7jxMjwbOQTsJ035zrZX8yQYoHtJPx3EOR+m6rWDBMsjKxxOOsD13oMwuEEzhai
         7EAVjl3PNusMl0h5l1unf8R3CpefPQ/NoqfQQPWqknXuVAb3+XiGW7KsdJFHRhxDj4cT
         eKb/f/DxlfK6dCsPNiPBrVXLz2L3b0DZBXiSVOhOK8wwOCyVcY2OP6Sz3gRnaHX2kRkT
         n4kLFWioc9+FpH/K/3axb2qZB7DI+jo2gYvFzkTdEmiRGUA/g5kbeAw4e6zJvhmSRS9F
         kVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793661036; x=1794265836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=gSxjo7G/C4iKFeABmyD/cOIF2FiAgdOm/dXL8y9CJck=;
        b=UeHREIyZvV2ZiQyfe/JbCn9r8u3FxzOgV7Jk/pqkIqfi0xwMbSb/4RnTOjTh1/QWsR
         NR2/6NmGz4vCMa0fRixAgWbMjjJWM7AmCeiIS9XWqK//1W6VNWuB4wtXS1BnZ5Nf6SZJ
         2LcznDa4NLt2T1zbwGIa2NPeOGBz0gcyHJU710ekuxJt9PhdSSsNBg6chNO9ExitDjAm
         us/B+69rGD82zal/9Z1hyLcQDwrDrGvPSOZ4DEfN+eYikSFghcBvXxKCQP+y7wWoNjhg
         C0VkZywXAH1goXkDhYbvSzx5Qp8zYgm5cTvhpiepU3kMnYBQJ1h0aBOfWQxoHhpp7CkK
         aIjQ==
X-Forwarded-Encrypted: i=1; AKwUvByKO6izQNqaQrGx1S+RxrHbacCW8sq1QdGXKXBFuxqwxe6Ld3dazobUwdJs95J+xhf3IQ09I6w00YNLDwjMPDR1@lists.infradead.org
X-Gm-Message-State: AFq9FYK+ye6T0E45sxZCcP5OlOjyd3MAGzBvmyQgmELAZb9wDRP3nmP1
	cDlo5NnBCPFu7ZPVnsyYXqHs2EKDA2dmYtoD00PIzxVeFcMXZBkwL3OAieGGIHmoE80LnAizM24
	Jp+cay0HHvGaoGFWQfj6Bz/NImjINDPU7FFXFK41QAKfVsR0027fuCD9UF1IiqLNzPnsJh6Dsp5
	GiAw==
X-Gm-Gg: AYBFou2JRFSNm/ftfoQ1bzL5+n+lb+jPGljHMCEuokn+84YSAQbCqBgzYSqM05hw5lg
	lpwXkbSQsMjb5XWYweBqcOHI1IytXcDHYQG/5husBy7MwOwPrBw2HZm4IfVINr9pZCIJLxhSRVg
	XdW7sfsiHjmp5H78vGcE1cyl1mOrv6sCj24q20tzmUj5NI8QuYADwA8csQHoSlgRXf7qbESkqlw
	QQKKv3Sx2MMMtsDJsa/9BsqZVXpXl6HChlwEZ3ZaBvWj1KpzYNYZDLszdotgkocy3ConuGVFt8/
	QvK0U9t0NHY0/s+0w5b1bB42TaH1NCjs5YsR00u42btfbyyvmVw8h3wXPjIEWcVdAHJG2FiZAV8
	lJuB4YOwKeh6btYIJXFF12Pccky1QsrUy4NlGGitP4rzc73kqTebid2xQgX6/RpBRduazLD/B8X
	v4
X-Received: by 2002:a05:620a:880e:b0:93e:c12c:fbcf with SMTP id af79cd13be357-944217b26bfmr1799037085a.75.1793661035840;
        Mon, 02 Nov 2026 15:10:35 -0800 (PST)
X-Received: by 2002:a05:620a:880e:b0:93e:c12c:fbcf with SMTP id af79cd13be357-944217b26bfmr1799034385a.75.1793661035243;
        Mon, 02 Nov 2026 15:10:35 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:8b9e:7797:dd05:11cb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cf248sm25198725e9.2.2026.11.02.15.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:10:34 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: akpm@linux-foundation.org, rafael@kernel.org, tglx@kernel.org,
        peterz@infradead.org
Cc: Heiko Stuebner <heiko@sntech.de>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
        linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support),
        linux-kernel@vger.kernel.org (open list:CPU HOTPLUG)
Subject: [PATCH 1/2] smpboot: Allow restricting per-CPU threads to a CPU mask
Date: Tue,  3 Nov 2026 00:09:40 +0100
Message-ID: <af37c4e7811a86adafb2064e7cf4aa4f5090ab4b.1793660202.git.daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793660202.git.daniel.lezcano@oss.qualcomm.com>
References: <cover.1793660202.git.daniel.lezcano@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA5MSBTYWx0ZWRfX9/8qNbewXjsS
 ZS/0qXm8dL8mGm9rLCBNKUXSXPNHlfTIrfgZPIC81uvd29R2f4IEFcVc0y69fm2E7Ecw2aTs8vB
 KLk1M4TsmpPIvi0/lpTtiwYH1CZ8OdjBUdDh5NatK8APktaCCPmUcZftkQy+K9dwZR8pZyorQdu
 chU9w1e0hkhNmrP515v8oCQth6cAloe1JUiSNdNB4iCnN9RrtevVh9d7mFvMRYLvPrjThJAEVL/
 PKcgWmA3IO8W74UgvrF005b3pb9Sot4MpuwMZPmNjwf25ok7U9NrN13xZ2T0RQITASmVgUYH1pG
 1ShFxZJc+i0tUHfs3qxfens4u2JTBDDYeu7krGTD4poN3fJVjE0rx4MdRwBxXoLz6QwZmfr/3LA
 bdUJISu5JNlRNj1PFl7+xIJkjghi1Ytx18uAB4xv9EZqyiispnBoncvzwZFC+nxa75YKi5S+pvz
 QdePLunEX2O+C2F1TvQ==
X-Proofpoint-GUID: A2R4-tW-pEqjW7y8kFA5b45EnU2P1JKx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA5MSBTYWx0ZWRfXz6vz570/t9l1
 aQnLPejZMf5fvWIIS9rnZFOQb5V21vIQcJvHhJYKZqRkl9LEPrnVBiLMUPSHYYxaqIxFs6JnOzF
 GT33xdNh71UQ+FFWYUacnhjRMfk29j8=
X-Proofpoint-ORIG-GUID: A2R4-tW-pEqjW7y8kFA5b45EnU2P1JKx
X-Authority-Analysis: v=2.4 cv=I9fw19gg c=1 sm=1 tr=0 ts=6ae9186c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=igP56NFfHUNPCibkussA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 phishscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_151038_104719_D4C33ED3 
X-CRM114-Status: GOOD (  22.63  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

smpboot_register_percpu_thread() creates a thread for every online CPU
and registers the descriptor for subsequent CPU hotplug operations.
There is currently no way to restrict these threads to a subset of
CPUs, even when the user only needs work performed on that subset.

For example, an idle injection device targets a specific CPU mask.
Creating threads outside that mask consumes resources unnecessarily.
Supporting multiple such devices also requires each descriptor to
manage only the threads associated with its own CPUs.

Add an optional CPU mask to struct smp_hotplug_thread and apply it
throughout the thread lifecycle. Registration creates threads only for
online CPUs in the mask. CPU bring-up creates threads for selected
CPUs that were offline at registration, while parking and unparking
are restricted to the same mask.

Apply the restriction to thread destruction as well, both during
unregistration and registration failure cleanup. This is necessary
when descriptors with disjoint masks share the same per-CPU task
storage: tearing down one descriptor must not stop or clear threads
owned by another descriptor.

The caller must keep the mask valid and unchanged until the descriptor
is unregistered. Callers sharing per-CPU task storage must ensure their
masks do not overlap and serialize ownership changes themselves.

A NULL mask preserves the existing behavior, so current users continue
to manage threads on all CPUs.

Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 include/linux/smpboot.h |  4 ++++
 kernel/smpboot.c        | 17 +++++++++++++++--
 2 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/include/linux/smpboot.h b/include/linux/smpboot.h
index 9d1bc65d226c..98c072eeaf24 100644
--- a/include/linux/smpboot.h
+++ b/include/linux/smpboot.h
@@ -5,6 +5,7 @@
 #include <linux/types.h>
 
 struct task_struct;
+struct cpumask;
 /* Cookie handed to the thread_fn*/
 struct smpboot_thread_data;
 
@@ -27,6 +28,8 @@ struct smpboot_thread_data;
  *			unparked (cpu online)
  * @selfparking:	Thread is not parked by the park function.
  * @thread_comm:	The base name of the thread
+ * @cpumask:		Optional mask of CPUs on which to create threads. Must remain
+ *			valid and unchanged until the descriptor is unregistered.
  */
 struct smp_hotplug_thread {
 	struct task_struct		* __percpu *store;
@@ -40,6 +43,7 @@ struct smp_hotplug_thread {
 	void				(*unpark)(unsigned int cpu);
 	bool				selfparking;
 	const char			*thread_comm;
+	const struct cpumask		*cpumask;
 };
 
 int smpboot_register_percpu_thread(struct smp_hotplug_thread *plug_thread);
diff --git a/kernel/smpboot.c b/kernel/smpboot.c
index 4503b60ce9bd..07857523a465 100644
--- a/kernel/smpboot.c
+++ b/kernel/smpboot.c
@@ -168,6 +168,9 @@ __smpboot_create_thread(struct smp_hotplug_thread *ht, unsigned int cpu)
 	struct task_struct *tsk = *per_cpu_ptr(ht->store, cpu);
 	struct smpboot_thread_data *td;
 
+	if (ht->cpumask && !cpumask_test_cpu(cpu, ht->cpumask))
+		return 0;
+
 	if (tsk)
 		return 0;
 
@@ -225,6 +228,9 @@ static void smpboot_unpark_thread(struct smp_hotplug_thread *ht, unsigned int cp
 {
 	struct task_struct *tsk = *per_cpu_ptr(ht->store, cpu);
 
+	if (ht->cpumask && !cpumask_test_cpu(cpu, ht->cpumask))
+		return;
+
 	if (!ht->selfparking)
 		kthread_unpark(tsk);
 }
@@ -244,6 +250,9 @@ static void smpboot_park_thread(struct smp_hotplug_thread *ht, unsigned int cpu)
 {
 	struct task_struct *tsk = *per_cpu_ptr(ht->store, cpu);
 
+	if (ht->cpumask && !cpumask_test_cpu(cpu, ht->cpumask))
+		return;
+
 	if (tsk && !ht->selfparking)
 		kthread_park(tsk);
 }
@@ -267,6 +276,9 @@ static void smpboot_destroy_threads(struct smp_hotplug_thread *ht)
 	for_each_possible_cpu(cpu) {
 		struct task_struct *tsk = *per_cpu_ptr(ht->store, cpu);
 
+		if (ht->cpumask && !cpumask_test_cpu(cpu, ht->cpumask))
+			continue;
+
 		if (tsk) {
 			kthread_stop_put(tsk);
 			*per_cpu_ptr(ht->store, cpu) = NULL;
@@ -279,7 +291,8 @@ static void smpboot_destroy_threads(struct smp_hotplug_thread *ht)
  * 					    to hotplug
  * @plug_thread:	Hotplug thread descriptor
  *
- * Creates and starts the threads on all online cpus.
+ * Creates and starts the threads on online CPUs selected by the descriptor's
+ * cpumask, or all online CPUs if no mask is specified.
  */
 int smpboot_register_percpu_thread(struct smp_hotplug_thread *plug_thread)
 {
@@ -308,7 +321,7 @@ EXPORT_SYMBOL_GPL(smpboot_register_percpu_thread);
  * smpboot_unregister_percpu_thread - Unregister a per_cpu thread related to hotplug
  * @plug_thread:	Hotplug thread descriptor
  *
- * Stops all threads on all possible cpus.
+ * Stops all threads associated with the descriptor, including offline CPUs.
  */
 void smpboot_unregister_percpu_thread(struct smp_hotplug_thread *plug_thread)
 {
-- 
2.43.0


