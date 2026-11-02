Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C546D606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 23:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=v7FUF4N0;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZUNjv8iO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XztgwNDY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RNPEXbcvLHlz70jUnJvyWiGs4WgJ8gGzePseO2P4c0Y=; b=v7FUF4N0ZyPWqA
	ojWAHyNI5rt9+PxAVNHAabueinboqOSaAqo7sVjZeYNFu7yuaYT/z5u0rLqsyax/NSK/DJNbW+nYm
	4gXk7uxX7hQ81rhISZ5NQsnO4x1UfY4mjR0fGHKanoL0fVZRDbppj0MHqb/V9WyOfOeMFpyODXvek
	vIh7VaXfqSd7d2z3nIZjKV8lEGRJ9CuZd8VXjlPNwFYx0Yl9hMDM/KaqwrbXLL+oRA1b6KLzA2iIs
	otkVukNHMaOr5ePCxyctTQi0OLVVGm7hOriaSpXhuwoeE8cnDQ3ji6A1F6iK5jKyVk8ARKB+GqYMf
	Olml6KxSvvHuB2WX8TaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1Au-00000000cKb-3eFO;
	Mon, 02 Nov 2026 23:10:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xO1Al-00000000cBv-2KTz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 23:10:41 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K6CoH1746253
	for <linux-arm-kernel@lists.infradead.org>; Mon, 2 Nov 2026 23:10:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=RNPEXbcvLHl
	z70jUnJvyWiGs4WgJ8gGzePseO2P4c0Y=; b=ZUNjv8iOu0cW5VdrUGImHyJiA16
	Y+L8jMtCrcru0H+eiv4v+0T6AGLDpg7SuT/sSijN3ioOElR55w7lOd2zSi3aNJka
	Q40NDdlPZuInNL1WYquTpit3QKEn5NCAiirvIo8h9v6Qh6MfHYxzNlSh7VMTB23B
	S+5YTrjCRs6pNv69AOmVdj/r1O/XSWGTivyq3LFfirFuYMw/XXxn520EXWFv4rbZ
	OOLsPv/8PluEs5ceDLV2srFwq3cWw8S1yULOkj4b8TeEzvxZHYYORtIczAwaUsa8
	qaihozL7CbKg+/Lz+B/gXXbjXAVqZVu+4NVHpYYejX26wz6pvpXjOiHlXZw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpqmvuaa2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 23:10:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f559420f3so316985385a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 02 Nov 2026 15:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793661038; x=1794265838; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RNPEXbcvLHlz70jUnJvyWiGs4WgJ8gGzePseO2P4c0Y=;
        b=XztgwNDYvBYckAp8IUw0EKHMQWskFk4CF1IfzVWUKaPLGJGM3LWhZeniUrH3lVPRLI
         x5zCE6u430bc14MXldOyiexcUhS2VGZphoiKVIfbHKMOzhIixGxzCoVl+RFOfvkFlGSa
         YCakIwKh+pv+q8ReFcpRmpVqCDS/Dafvg+OpfsIRhUIAEjXnEZVTlVPWd3uh/LgI6NhL
         GrhiZa0SEnpS/o0MVoJLivjUTJWOqxjf+y4OSIZvan8b7uT8pkAqs6QtHWuzHixv7tZi
         u472oZOko66DkioQ1OSjyPD+qpgWNRc+UHbnHocovmsc5zCbbU5ND9UC+jc7aXUh9Q4m
         uJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793661038; x=1794265838;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RNPEXbcvLHlz70jUnJvyWiGs4WgJ8gGzePseO2P4c0Y=;
        b=WKiMIvLk2DB6AFHnqfuZ4txm4kE4XwPcmb1hJ4kJ4dZIGxE0PJjlvGNoiMkQ/K/L9h
         YBetrEsAwFSneT4KwnrV2lq+8TynyHEMNOKq78Jzbf+PV0BxzLFRa+FbLTB5giOD69gH
         PVpAWegVce6A+IZ6zExmk2xjJHMzDwPm76Voz33DJ4EVYhKKOGYgT/w9Yf0+KINslOpD
         yWgg+90JVSYwoLb+ghdel85xPq8v9hk8rhEkEOXlOEA6Xuc8GUbzZ7tebTun72eKMlN0
         OLANUiysRlsj3anu9ONK8bRBXmhM1/oRZzE/QvFlMo3XXRaKLm0XAh4qqzFCwndAUdlk
         Sxlg==
X-Forwarded-Encrypted: i=1; AKwUvBzoFaPBGkTVahB12r0/OKjZoyqNqJdgsN+RzcyKPOBh35AYjp2t1ndmY110XYzReTLIT8QVw79tKvUGu92u/cXS@lists.infradead.org
X-Gm-Message-State: AFq9FYKJEVsOJKzZUpLGVnxL7/QgPO2YIipvI3+Dr6o7gi63FDlzl67V
	DGxfXNptNopwu5S+gW9o6R9DiuNxOHEi1amM7G0P+hUwUYEPNxXxNOVWdDAcijN21NOgiq4aUHe
	7m4kgBE7rcSnuDzK+UpTKEvFNGdW3E1YkjxqbN+AaGUepV8E6xQ5InBcl0wAHOd90HL3t3ST4zf
	F0+A==
X-Gm-Gg: AYBFou33YwzdDaLbqsihtygYGl3pKp+/o9K98/E5ERrVYruliyhTggfF3tgGUHiqNtl
	yx1ASwJb5DecAqY7U9BPiegksVilEVIfgxPSmepVg9yBv0BaGswYtd/BEMEyf+PJx1B6636V9AM
	PSWNXE3gfk09fi1Q8aO3wy0hxT6CQffOXPEcAjtpzji377tmVXC9ibikp+/XkWXYmww6cKsNbEC
	lAvBOj1lDwa6PE1CfWO0B+tmM7HoHtIgzzDyzB4NsWGym/HkJWtvCwDhbiuVivfm4HVPKPC6MGs
	Z9OumyqG0dBDl6CkCanY2Qtf0rb5kbn/YTKOeXrha+u1Ksfh7rnBQk5lKQ3DG+FeTB9zafn1fxx
	geiETJtOr91g5fUYVIz5lV8mpZqOc8Pm7dAvgrbaGidbpCgUdiEG8cRx9sVKVIIXZTUQtT0dCu8
	9+
X-Received: by 2002:a05:620a:28c6:b0:93c:6fd4:467a with SMTP id af79cd13be357-94421541a87mr1857269185a.2.1793661037849;
        Mon, 02 Nov 2026 15:10:37 -0800 (PST)
X-Received: by 2002:a05:620a:28c6:b0:93c:6fd4:467a with SMTP id af79cd13be357-94421541a87mr1857266285a.2.1793661037320;
        Mon, 02 Nov 2026 15:10:37 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:8b9e:7797:dd05:11cb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cf248sm25198725e9.2.2026.11.02.15.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 15:10:35 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
To: akpm@linux-foundation.org, rafael@kernel.org, tglx@kernel.org,
        peterz@infradead.org
Cc: Heiko Stuebner <heiko@sntech.de>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC support),
        linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support),
        linux-pm@vger.kernel.org (open list:POWER MANAGEMENT CORE),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] powercap: idle_inject: Create per-CPU threads on registration
Date: Tue,  3 Nov 2026 00:09:41 +0100
Message-ID: <71091b05daff46020ccd1bba3ed66b0055c85046.1793660202.git.daniel.lezcano@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1793660202.git.daniel.lezcano@oss.qualcomm.com>
References: <cover.1793660202.git.daniel.lezcano@oss.qualcomm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=TMDQ2Fla c=1 sm=1 tr=0 ts=6ae9186f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=Z4Rwk6OoAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=z2xlO20o2AOZ5rEB0BcA:9 a=bTQJ7kPSJx9SKPbeHEYW:22 a=HkZW87K1Qel5hWWM3VKY:22
X-Proofpoint-GUID: gV-Z9F7Xb7OTfnVolELLazN58BWyBQKI
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA5MSBTYWx0ZWRfX8HCLu7CYluhJ
 E7RkGisuS9OpXzAhV6sxjJFbZkjozfAElQkorNL3FbmLSGvH02EmsnhbqE8KV3XkoIGbRGNpw2w
 mMTEY6HE7NEZ3Otc8dcr7rVSHzLU0gQ=
X-Proofpoint-ORIG-GUID: gV-Z9F7Xb7OTfnVolELLazN58BWyBQKI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA5MSBTYWx0ZWRfXxb2dPYK8zrE8
 fwofMiff+Ml9JH884Co1JtE6TRu570/U7UnBCF7Wdq8i9A/PsJiI+P7nlK10LjGdxWZD/pppwrx
 AoQWr3SLtMIPRqCneUweBpYjE7twYHcsbu5d4SaVH4Q2zOz67zkLkzfNERcp31V7Q2bpnGnH8bD
 HUYPOkvNVKJmknHMl0jq4dH4vogNOobtossGi17YUjJsha7XeaXnlsUbstvqrtTeJSwPVWEA91r
 HV4ile+Uoh3TS8JeLIF5cHG16W+pG8ttI7vP2FWzFOBwzsZCdFvfiPYU+Yz+fHIHOWCS2tu58RJ
 PYIuw2v2EuGY5MjIZSl8qMD4Rh51ThZyEycZ7cJhjrcJXXOkfQgZ7gZcntM8W+M5aIOaVKpiKRi
 svM8fgCApqej73HzAQJvq/suQJTjkM5IeHkwP0eCQSRN1sCx8PprEj6gSHkWNvbNpyg870+3oSP
 zeZ7FkRu8ubILpSfKzQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_151039_620836_D56C484D 
X-CRM114-Status: GOOD (  26.79  )
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

Create idle injection threads when a device registers instead of
creating them unconditionally during early initialization. Destroy the
threads when the device unregisters.

Use a per-device smpboot descriptor with the device's CPU mask so thread
creation and CPU hotplug handling are limited to the CPUs registered by
that device. Allow stopping devices whose offline CPUs have not yet had
a thread created, and update the registration documentation to describe
the thread lifecycle and possible failures.

Serialize CPU ownership checks and claims with a framework-wide mutex.
Without serialization, registrations with overlapping masks can both
observe an unclaimed CPU and overwrite each other's device pointer.
Their smpboot descriptors can then share the same per-CPU task, allowing
one device's teardown to destroy a thread belonging to another device.
Registration rollback can also clear another caller's ownership.

Hold the mutex through smpboot registration and failure rollback, and
during thread unregistration through ownership release. This prevents a
CPU from being claimed again until its previous thread is destroyed.

Stop idle injection before acquiring the mutex, keeping timer callback
cancellation and stop-side hotplug exclusion outside the ownership
critical section. Neither the idle injection threads nor their smpboot
hotplug paths acquire this mutex. The existing caller-side lifecycle
synchronization requirement remains in effect.

Reported-by: Andrew Morton <akpm@linux-foundation.org>
Cc: Rafael J. Wysocki (Intel) <rafael@kernel.org>
Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
---
 drivers/powercap/idle_inject.c | 69 +++++++++++++++++++++-------------
 1 file changed, 42 insertions(+), 27 deletions(-)

diff --git a/drivers/powercap/idle_inject.c b/drivers/powercap/idle_inject.c
index a25eb2018acd..24646b8be9ac 100644
--- a/drivers/powercap/idle_inject.c
+++ b/drivers/powercap/idle_inject.c
@@ -10,11 +10,9 @@
  * It relies on the smpboot kthreads feature providing common code for CPU
  * hotplug and thread [un]parking.
  *
- * All of the kthreads used for idle injection are created at init time.
- *
- * Next, the users of the idle injection framework provide a cpumask via
- * its register function. The kthreads will be synchronized with respect to
- * this cpumask.
+ * Users of the idle injection framework provide a cpumask via its register
+ * function. The kthreads are created on demand for CPUs in this mask and
+ * will be synchronized with respect to it.
  *
  * The idle + run duration is specified via separate helpers and that allows
  * idle injection to be started.
@@ -40,6 +38,7 @@
 #include <linux/cpu.h>
 #include <linux/hrtimer.h>
 #include <linux/kthread.h>
+#include <linux/mutex.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/smpboot.h>
@@ -60,6 +59,7 @@ struct idle_inject_thread {
 /**
  * struct idle_inject_device - idle injection data
  * @timer: idle injection period timer
+ * @threads: per-device CPU hotplug thread descriptor
  * @idle_duration_us: duration of CPU idle time to inject
  * @run_duration_us: duration of CPU run time to allow
  * @latency_us: max allowed latency
@@ -82,6 +82,7 @@ struct idle_inject_thread {
  */
 struct idle_inject_device {
 	struct hrtimer timer;
+	struct smp_hotplug_thread threads;
 	unsigned int idle_duration_us;
 	unsigned int run_duration_us;
 	unsigned int latency_us;
@@ -92,6 +93,9 @@ struct idle_inject_device {
 static DEFINE_PER_CPU(struct idle_inject_thread, idle_inject_thread);
 static DEFINE_PER_CPU(struct idle_inject_device *, idle_inject_device);
 
+/* Serialize CPU ownership changes and the associated thread lifecycle. */
+static DEFINE_MUTEX(idle_inject_lock);
+
 /**
  * idle_inject_wakeup - Wake up idle injection threads
  * @ii_dev: target idle injection device
@@ -279,7 +283,8 @@ void idle_inject_stop(struct idle_inject_device *ii_dev)
 		iit = per_cpu_ptr(&idle_inject_thread, cpu);
 		iit->should_run = 0;
 
-		wait_task_inactive(iit->tsk, TASK_ANY);
+		if (iit->tsk)
+			wait_task_inactive(iit->tsk, TASK_ANY);
 	}
 
 	cpu_hotplug_enable();
@@ -319,12 +324,12 @@ static int idle_inject_should_run(unsigned int cpu)
  * idle
  *
  * This function creates an idle injection control device structure for the
- * given set of CPUs and initializes the timer associated with it. This
+ * given set of CPUs, registers their kthreads and initializes the timer. This
  * function also allows to register update()callback.
  * It does not start any injection cycles.
  *
- * Return: NULL if memory allocation fails, idle injection control device
- * pointer on success.
+ * Return: NULL if allocation or thread registration fails, or a CPU is already
+ * registered; idle injection control device pointer on success.
  */
 
 struct idle_inject_device *idle_inject_register_full(struct cpumask *cpumask,
@@ -342,6 +347,8 @@ struct idle_inject_device *idle_inject_register_full(struct cpumask *cpumask,
 	ii_dev->latency_us = UINT_MAX;
 	ii_dev->update = update;
 
+	mutex_lock(&idle_inject_lock);
+
 	for_each_cpu(cpu, to_cpumask(ii_dev->cpumask)) {
 
 		if (per_cpu(idle_inject_device, cpu)) {
@@ -352,6 +359,20 @@ struct idle_inject_device *idle_inject_register_full(struct cpumask *cpumask,
 		per_cpu(idle_inject_device, cpu) = ii_dev;
 	}
 
+	ii_dev->threads = (struct smp_hotplug_thread) {
+		.store = &idle_inject_thread.tsk,
+		.setup = idle_inject_setup,
+		.thread_fn = idle_inject_fn,
+		.thread_comm = "idle_inject/%u",
+		.thread_should_run = idle_inject_should_run,
+		.cpumask = to_cpumask(ii_dev->cpumask),
+	};
+
+	if (smpboot_register_percpu_thread(&ii_dev->threads))
+		goto out_rollback;
+
+	mutex_unlock(&idle_inject_lock);
+
 	return ii_dev;
 
 out_rollback:
@@ -361,6 +382,8 @@ struct idle_inject_device *idle_inject_register_full(struct cpumask *cpumask,
 		per_cpu(idle_inject_device, cpu_rb) = NULL;
 	}
 
+	mutex_unlock(&idle_inject_lock);
+
 	kfree(ii_dev);
 
 	return NULL;
@@ -372,11 +395,11 @@ EXPORT_SYMBOL_NS_GPL(idle_inject_register_full, "IDLE_INJECT");
  * @cpumask: CPUs to be affected by idle injection
  *
  * This function creates an idle injection control device structure for the
- * given set of CPUs and initializes the timer associated with it.  It does not
- * start any injection cycles.
+ * given set of CPUs, registers their kthreads and initializes the timer. It
+ * does not start any injection cycles.
  *
- * Return: NULL if memory allocation fails, idle injection control device
- * pointer on success.
+ * Return: NULL if allocation or thread registration fails, or a CPU is already
+ * registered; idle injection control device pointer on success.
  */
 struct idle_inject_device *idle_inject_register(struct cpumask *cpumask)
 {
@@ -398,23 +421,15 @@ void idle_inject_unregister(struct idle_inject_device *ii_dev)
 
 	idle_inject_stop(ii_dev);
 
+	mutex_lock(&idle_inject_lock);
+
+	smpboot_unregister_percpu_thread(&ii_dev->threads);
+
 	for_each_cpu(cpu, to_cpumask(ii_dev->cpumask))
 		per_cpu(idle_inject_device, cpu) = NULL;
 
+	mutex_unlock(&idle_inject_lock);
+
 	kfree(ii_dev);
 }
 EXPORT_SYMBOL_NS_GPL(idle_inject_unregister, "IDLE_INJECT");
-
-static struct smp_hotplug_thread idle_inject_threads = {
-	.store = &idle_inject_thread.tsk,
-	.setup = idle_inject_setup,
-	.thread_fn = idle_inject_fn,
-	.thread_comm = "idle_inject/%u",
-	.thread_should_run = idle_inject_should_run,
-};
-
-static int __init idle_inject_init(void)
-{
-	return smpboot_register_percpu_thread(&idle_inject_threads);
-}
-early_initcall(idle_inject_init);
-- 
2.43.0


