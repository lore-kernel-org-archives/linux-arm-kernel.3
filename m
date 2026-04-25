Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69BAFF8863
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 25 Apr 2026 22:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ph7R9L13qRaJL3QC1gV+rLNWu/VKavX3EHLSwKF2rZc=; b=kTXdjXIsj9JQIO+MMSWwArRGLl
	xfKALe1CYDWQoUPkpkNdGDr2p69nK9aTTfoW66ftEb3zDUar8INvitTMqUXMmiNSx2R4Rk8/80JCO
	rCj+qMC/GGRwnPB7XbivqphmLj5wmRvLrTGoqKbp9kum4I4+GeZoQe/us9QSRoHBP2Bsz/Y9X+0Xp
	EcbkMlMk1TzLxnB9ZAdTuK4LozklYk7EdTIfpxsU/Y+FX/OkJAH8NiPQfJWJzLwHAtI7/v9y9F+hT
	ChkSkNlRm21y5WzD2ivc+WNjYY8o4y9ETUwZu1uwcRjwvQfUqRJNID3neEu7vEu/B5LHMtYYKDgrb
	0b8Ihnzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlrC-0000000Ezvd-16PD;
	Sat, 25 Apr 2026 22:52:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlqi-0000000EzLv-2rUz
	for linux-arm-kernel@bombadil.infradead.org;
	Sat, 25 Apr 2026 22:51:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ph7R9L13qRaJL3QC1gV+rLNWu/VKavX3EHLSwKF2rZc=; b=UOqItQ5Va5oQfQngg4MaR24RWp
	1gRfLlm4G/3vG/dDXF4qZ9S9g2CsOlpQVBHGbtnSC3IVu7miBYJPkINHplGJvjzWzU1ov9/oovM0f
	SHUqYwOFP7HQWsZvByvIOU5W2FZd239TQIpmdeg/CIyJ89U0ER4YV5bkPWcaZwfZunqCFY6Cp4+8Y
	mxbknIEGr/y+p6wosfvmm8HR3IViGBakcPJE8MPkzPMM2QVgzUtiymMNC+AdrAfnSnrX2+OUbHhzb
	Pkubb3lL1KBpl7etjJxmhhUtM5dQCdt/Lo7F6JwOw6wqV+gB6cTNEJYwTxjkJf0VrqKJB2fqxMLrb
	jQCDa2+Q==;
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGlqf-0000000GMoo-1ncH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 25 Apr 2026 22:51:43 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2c16233ee11so12493184eec.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 25 Apr 2026 15:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777157499; x=1777762299; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ph7R9L13qRaJL3QC1gV+rLNWu/VKavX3EHLSwKF2rZc=;
        b=fG3FV2wOc6+eSgYKD8r2I1/IwDl3hp7KpFxVZ9TSdBcuqsR2IUwJWRfI2NAkqget4F
         W8WDymNaXlsx8BqDf+4C0mpItVHLyIOmLzE32zvEsaqZdwr4Iz7yxZj1w6tF6Ez9S4ai
         CyJEMIgY92gCrv1PHSICHcqonoEoEYPUUND/dwZjL9r482wYD3DTPEzlAc/rFJKeDMzS
         dHBoVHky8YAe9hnG75L5iN+AXMVZJvi2NoaUENg5tVwK4uTWOTl9iSF9feJAznwQSnrH
         DgCoKdjRFN/C4rLa3THulZ6+v2pDThAmKPXpJZOeMFCZJJP1DS3UZd5LO0Qwl+mZSY5C
         TjOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777157499; x=1777762299;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ph7R9L13qRaJL3QC1gV+rLNWu/VKavX3EHLSwKF2rZc=;
        b=e6ph9jZI0xL4gErMAD0Y05Q1XKT9IBAuGrbOCGJr5EpzAQ/J846JjiZoztGJEd3ipq
         7qcC4Mlw3vu6RltFoROv1ggpD668GFU0+2G9YEFNVb38NTXn6GnDgHpVVJxGB9ppJ0Vs
         c1pP49S3vK8C+9ELSV1ohpqwopO0IROt1PfrEXfA8cBJx8ssbwJS+OUyHxESDTenTyJB
         bWx2r6USULk+Zc5aZtksSOQdbSjYlHi/RAMWjRjUoA4xkpTmRKcH0xkv1sdqSuDDUWZE
         agOmpC2WB6BY803zrco78n7NRJMFUINm3VNj9A+zqSxCoqmHMcmZguzLJJ5oje42AZUL
         IlsQ==
X-Forwarded-Encrypted: i=1; AFNElJ9eHjVJYUvIlV/h4nihqtf9gM2IOkHTok4aTHv32iLbw/WwX4Ix47z2bGriUdXyp3gQPwjKXiMyXB64Ey7pP0DK@lists.infradead.org
X-Gm-Message-State: AOJu0YxLzWo/LWfa5IzU3auW8v5fMqDORU37viCDR2ror4zXJUXaLCtU
	JEEh1ZNaAVtKc++ja5LQQyl+z/JZ6Qa57UBvtMLqDOSwFnHi6kPF/XIGhpeLy0AXbnw/entpVvx
	wa1rbqTtCQw==
X-Received: from dybor13.prod.google.com ([2002:a05:7301:1f0d:b0:2d8:4599:1d20])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:40c9:b0:2e6:ff79:e344
 with SMTP id 5a478bee46e88-2e6ff7a04bemr13956737eec.9.1777157498644; Sat, 25
 Apr 2026 15:51:38 -0700 (PDT)
Date: Sat, 25 Apr 2026 15:49:33 -0700
In-Reply-To: <20260425224951.174663-1-irogers@google.com>
Mime-Version: 1.0
References: <20260425174858.3922152-1-irogers@google.com> <20260425224951.174663-1-irogers@google.com>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
Message-ID: <20260425224951.174663-42-irogers@google.com>
Subject: [PATCH v7 41/59] perf netdev-times: Port netdev-times to use python module
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org, adrian.hunter@intel.com, james.clark@linaro.org, 
	leo.yan@linux.dev, namhyung@kernel.org, tmricht@linux.ibm.com
Cc: alice.mei.rogers@gmail.com, dapeng1.mi@linux.intel.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, mingo@redhat.com, peterz@infradead.org, 
	Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_235141_615112_D9316FE7 
X-CRM114-Status: GOOD (  15.74  )
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

Ported from tools/perf/scripts/python/.
- Refactored the script to use a class structure (NetDevTimesAnalyzer)
  to encapsulate state.
- Used perf.session for event collection and processed them in time
  order at the end to match legacy behavior.
- Extracted tracepoint fields directly from sample attributes.
- Moved format string constants to module level.
- Cleaned up Python 2 compatibility artifacts (like cmp_to_key).

Assisted-by: Gemini:gemini-3.1-pro-preview
Signed-off-by: Ian Rogers <irogers@google.com>
---
v2: Corrected Field Names: Fixed getattr calls for skblen and dev_name
    to use "len" and "name" respectively, as exposed by the actual
    tracepoints.
---
 tools/perf/python/netdev-times.py | 472 ++++++++++++++++++++++++++++++
 1 file changed, 472 insertions(+)
 create mode 100755 tools/perf/python/netdev-times.py

diff --git a/tools/perf/python/netdev-times.py b/tools/perf/python/netdev-times.py
new file mode 100755
index 000000000000..3fe46b4e7f21
--- /dev/null
+++ b/tools/perf/python/netdev-times.py
@@ -0,0 +1,472 @@
+#!/usr/bin/env python3
+# SPDX-License-Identifier: GPL-2.0
+"""
+Display a process of packets and processed time.
+It helps us to investigate networking or network device.
+
+Ported from tools/perf/scripts/python/netdev-times.py
+"""
+
+import argparse
+from collections import defaultdict
+import sys
+from typing import Optional
+import perf
+
+# Format for displaying rx packet processing
+PF_IRQ_ENTRY = "  irq_entry(+%.3fmsec irq=%d:%s)"
+PF_SOFT_ENTRY = "  softirq_entry(+%.3fmsec)"
+PF_NAPI_POLL = "  napi_poll_exit(+%.3fmsec %s)"
+PF_JOINT = "         |"
+PF_WJOINT = "         |            |"
+PF_NET_RECV = "         |---netif_receive_skb(+%.3fmsec skb=%x len=%d)"
+PF_NET_RX = "         |---netif_rx(+%.3fmsec skb=%x)"
+PF_CPY_DGRAM = "         |      skb_copy_datagram_iovec(+%.3fmsec %d:%s)"
+PF_KFREE_SKB = "         |      kfree_skb(+%.3fmsec location=%x)"
+PF_CONS_SKB = "         |      consume_skb(+%.3fmsec)"
+
+
+class NetDevTimesAnalyzer:
+    """Analyzes network device events and prints charts."""
+
+    def __init__(self, cfg: argparse.Namespace):
+        self.args = cfg
+        self.session: Optional[perf.session] = None
+        self.show_tx = cfg.tx or (not cfg.tx and not cfg.rx)
+        self.show_rx = cfg.rx or (not cfg.tx and not cfg.rx)
+        self.dev = cfg.dev
+        self.debug = cfg.debug
+        self.buffer_budget = 65536
+        self.irq_dic: dict[int, list[dict]] = defaultdict(list)
+        self.net_rx_dic: dict[int, dict] = {}
+        self.receive_hunk_list: list[dict] = []
+        self.rx_skb_list: list[dict] = []
+        self.tx_queue_list: list[dict] = []
+        self.tx_xmit_list: list[dict] = []
+        self.tx_free_list: list[dict] = []
+
+        self.buffer_budget = 65536
+        self.of_count_rx_skb_list = 0
+        self.of_count_tx_queue_list = 0
+        self.of_count_tx_xmit_list = 0
+
+    def diff_msec(self, src: int, dst: int) -> float:
+        """Calculate a time interval(msec) from src(nsec) to dst(nsec)."""
+        return (dst - src) / 1000000.0
+
+    def print_transmit(self, hunk: dict) -> None:
+        """Display a process of transmitting a packet."""
+        if self.dev and hunk['dev'].find(self.dev) < 0:
+            return
+        queue_t_sec = hunk['queue_t'] // 1000000000
+        queue_t_usec = hunk['queue_t'] % 1000000000 // 1000
+        print(f"{hunk['dev']:7s} {hunk['len']:5d} "
+              f"{queue_t_sec:6d}.{queue_t_usec:06d}sec "
+              f"{self.diff_msec(hunk['queue_t'], hunk['xmit_t']):12.3f}msec      "
+              f"{self.diff_msec(hunk['xmit_t'], hunk['free_t']):12.3f}msec")
+
+    def print_receive(self, hunk: dict) -> None:
+        """Display a process of received packets and interrupts."""
+        show_hunk = False
+        irq_list = hunk['irq_list']
+        if not irq_list:
+            return
+        cpu = irq_list[0]['cpu']
+        base_t = irq_list[0]['irq_ent_t']
+
+        if self.dev:
+            for irq in irq_list:
+                if irq['name'].find(self.dev) >= 0:
+                    show_hunk = True
+                    break
+        else:
+            show_hunk = True
+
+        if not show_hunk:
+            return
+
+        base_t_sec = base_t // 1000000000
+        base_t_usec = base_t % 1000000000 // 1000
+        print(f"{base_t_sec}.{base_t_usec:06d}sec cpu={cpu}")
+        for irq in irq_list:
+            print(PF_IRQ_ENTRY %
+                  (self.diff_msec(base_t, irq['irq_ent_t']),
+                   irq['irq'], irq['name']))
+            print(PF_JOINT)
+            irq_event_list = irq['event_list']
+            for irq_event in irq_event_list:
+                if irq_event['event'] == 'netif_rx':
+                    print(PF_NET_RX %
+                          (self.diff_msec(base_t, irq_event['time']),
+                           irq_event['skbaddr']))
+                    print(PF_JOINT)
+
+        print(PF_SOFT_ENTRY % self.diff_msec(base_t, hunk['sirq_ent_t']))
+        print(PF_JOINT)
+        event_list = hunk['event_list']
+        for i, event in enumerate(event_list):
+            if event['event_name'] == 'napi_poll':
+                print(PF_NAPI_POLL %
+                      (self.diff_msec(base_t, event['event_t']),
+                       event['dev']))
+                if i == len(event_list) - 1:
+                    print("")
+                else:
+                    print(PF_JOINT)
+            else:
+                print(PF_NET_RECV %
+                      (self.diff_msec(base_t, event['event_t']),
+                       event['skbaddr'],
+                       event['len']))
+                if 'comm' in event:
+                    print(PF_WJOINT)
+                    print(PF_CPY_DGRAM %
+                          (self.diff_msec(base_t, event['comm_t']),
+                           event['pid'], event['comm']))
+                elif 'handle' in event:
+                    print(PF_WJOINT)
+                    if event['handle'] == "kfree_skb":
+                        print(PF_KFREE_SKB %
+                              (self.diff_msec(base_t, event['comm_t']),
+                               event['location']))
+                    elif event['handle'] == "consume_skb":
+                        print(PF_CONS_SKB %
+                              self.diff_msec(base_t, event['comm_t']))
+                print(PF_JOINT)
+
+    def handle_irq_handler_entry(self, event: dict) -> None:
+        """Handle irq:irq_handler_entry event."""
+        time = event['time']
+        cpu = event['cpu']
+        irq = event['irq']
+        irq_name = event['irq_name']
+        irq_record = {'irq': irq, 'name': irq_name, 'cpu': cpu,
+                      'irq_ent_t': time, 'event_list': []}
+        self.irq_dic[cpu].append(irq_record)
+
+    def handle_irq_handler_exit(self, event: dict) -> None:
+        """Handle irq:irq_handler_exit event."""
+        time = event['time']
+        cpu = event['cpu']
+        irq = event['irq']
+        if cpu not in self.irq_dic or not self.irq_dic[cpu]:
+            return
+        irq_record = self.irq_dic[cpu].pop()
+        if irq != irq_record['irq']:
+            return
+        irq_record['irq_ext_t'] = time
+        # if an irq doesn't include NET_RX softirq, drop.
+        if irq_record['event_list']:
+            self.irq_dic[cpu].append(irq_record)
+
+    def handle_irq_softirq_raise(self, event: dict) -> None:
+        """Handle irq:softirq_raise event."""
+        time = event['time']
+        cpu = event['cpu']
+        if cpu not in self.irq_dic or not self.irq_dic[cpu]:
+            return
+        irq_record = self.irq_dic[cpu].pop()
+        irq_record['event_list'].append({'time': time, 'event': 'sirq_raise'})
+        self.irq_dic[cpu].append(irq_record)
+
+    def handle_irq_softirq_entry(self, event: dict) -> None:
+        """Handle irq:softirq_entry event."""
+        time = event['time']
+        cpu = event['cpu']
+        self.net_rx_dic[cpu] = {'sirq_ent_t': time, 'event_list': []}
+
+    def handle_irq_softirq_exit(self, event: dict) -> None:
+        """Handle irq:softirq_exit event."""
+        time = event['time']
+        cpu = event['cpu']
+        irq_list = []
+        event_list = []
+        sirq_ent_t = None
+
+        if cpu in self.irq_dic:
+            irq_list = self.irq_dic[cpu]
+            del self.irq_dic[cpu]
+        if cpu in self.net_rx_dic:
+            sirq_ent_t = self.net_rx_dic[cpu]['sirq_ent_t']
+            event_list = self.net_rx_dic[cpu]['event_list']
+            del self.net_rx_dic[cpu]
+        if not irq_list or not event_list or sirq_ent_t is None:
+            return
+        rec_data = {'sirq_ent_t': sirq_ent_t, 'sirq_ext_t': time,
+                    'irq_list': irq_list, 'event_list': event_list}
+        self.receive_hunk_list.append(rec_data)
+
+    def handle_napi_poll(self, event: dict) -> None:
+        """Handle napi:napi_poll event."""
+        time = event['time']
+        cpu = event['cpu']
+        dev_name = event['dev_name']
+        work = event['work']
+        budget = event['budget']
+        if cpu in self.net_rx_dic:
+            event_list = self.net_rx_dic[cpu]['event_list']
+            rec_data = {'event_name': 'napi_poll',
+                        'dev': dev_name, 'event_t': time,
+                        'work': work, 'budget': budget}
+            event_list.append(rec_data)
+
+    def handle_netif_rx(self, event: dict) -> None:
+        """Handle net:netif_rx event."""
+        time = event['time']
+        cpu = event['cpu']
+        skbaddr = event['skbaddr']
+        skblen = event['skblen']
+        dev_name = event['dev_name']
+        if cpu not in self.irq_dic or not self.irq_dic[cpu]:
+            return
+        irq_record = self.irq_dic[cpu].pop()
+        irq_record['event_list'].append({'time': time, 'event': 'netif_rx',
+                                         'skbaddr': skbaddr, 'skblen': skblen,
+                                         'dev_name': dev_name})
+        self.irq_dic[cpu].append(irq_record)
+
+    def handle_netif_receive_skb(self, event: dict) -> None:
+        """Handle net:netif_receive_skb event."""
+        time = event['time']
+        cpu = event['cpu']
+        skbaddr = event['skbaddr']
+        skblen = event['skblen']
+        if cpu in self.net_rx_dic:
+            rec_data = {'event_name': 'netif_receive_skb',
+                        'event_t': time, 'skbaddr': skbaddr, 'len': skblen}
+            event_list = self.net_rx_dic[cpu]['event_list']
+            event_list.append(rec_data)
+            self.rx_skb_list.insert(0, rec_data)
+            if len(self.rx_skb_list) > self.buffer_budget:
+                self.rx_skb_list.pop()
+                self.of_count_rx_skb_list += 1
+
+    def handle_net_dev_queue(self, event: dict) -> None:
+        """Handle net:net_dev_queue event."""
+        time = event['time']
+        skbaddr = event['skbaddr']
+        skblen = event['skblen']
+        dev_name = event['dev_name']
+        skb = {'dev': dev_name, 'skbaddr': skbaddr, 'len': skblen, 'queue_t': time}
+        self.tx_queue_list.insert(0, skb)
+        if len(self.tx_queue_list) > self.buffer_budget:
+            self.tx_queue_list.pop()
+            self.of_count_tx_queue_list += 1
+
+    def handle_net_dev_xmit(self, event: dict) -> None:
+        """Handle net:net_dev_xmit event."""
+        time = event['time']
+        skbaddr = event['skbaddr']
+        rc = event['rc']
+        if rc == 0:  # NETDEV_TX_OK
+            for i, skb in enumerate(self.tx_queue_list):
+                if skb['skbaddr'] == skbaddr:
+                    skb['xmit_t'] = time
+                    self.tx_xmit_list.insert(0, skb)
+                    del self.tx_queue_list[i]
+                    if len(self.tx_xmit_list) > self.buffer_budget:
+                        self.tx_xmit_list.pop()
+                        self.of_count_tx_xmit_list += 1
+                    return
+
+    def handle_kfree_skb(self, event: dict) -> None:
+        """Handle skb:kfree_skb event."""
+        time = event['time']
+        skbaddr = event['skbaddr']
+        comm = event['comm']
+        pid = event['pid']
+        location = event['location']
+        for i, skb in enumerate(self.tx_queue_list):
+            if skb['skbaddr'] == skbaddr:
+                del self.tx_queue_list[i]
+                return
+        for i, skb in enumerate(self.tx_xmit_list):
+            if skb['skbaddr'] == skbaddr:
+                skb['free_t'] = time
+                self.tx_free_list.append(skb)
+                del self.tx_xmit_list[i]
+                return
+        for i, rec_data in enumerate(self.rx_skb_list):
+            if rec_data['skbaddr'] == skbaddr:
+                rec_data.update({'handle': "kfree_skb",
+                                 'comm': comm, 'pid': pid, 'comm_t': time, 'location': location})
+                del self.rx_skb_list[i]
+                return
+
+    def handle_consume_skb(self, event: dict) -> None:
+        """Handle skb:consume_skb event."""
+        time = event['time']
+        skbaddr = event['skbaddr']
+        for i, skb in enumerate(self.tx_xmit_list):
+            if skb['skbaddr'] == skbaddr:
+                skb['free_t'] = time
+                self.tx_free_list.append(skb)
+                del self.tx_xmit_list[i]
+                return
+
+    def handle_skb_copy_datagram_iovec(self, event: dict) -> None:
+        """Handle skb:skb_copy_datagram_iovec event."""
+        time = event['time']
+        skbaddr = event['skbaddr']
+        comm = event['comm']
+        pid = event['pid']
+        for i, rec_data in enumerate(self.rx_skb_list):
+            if skbaddr == rec_data['skbaddr']:
+                rec_data.update({'handle': "skb_copy_datagram_iovec",
+                                 'comm': comm, 'pid': pid, 'comm_t': time})
+                del self.rx_skb_list[i]
+                return
+
+
+
+    def print_summary(self) -> None:
+        """Print charts."""
+
+        # display receive hunks
+        if self.show_rx:
+            for hunk in self.receive_hunk_list:
+                self.print_receive(hunk)
+
+        # display transmit hunks
+        if self.show_tx:
+            print("   dev    len      Qdisc        "
+                  "       netdevice             free")
+            for hunk in self.tx_free_list:
+                self.print_transmit(hunk)
+
+        if self.debug:
+            print("debug buffer status")
+            print("----------------------------")
+            print(f"xmit Qdisc:remain:{len(self.tx_queue_list)} "
+                  f"overflow:{self.of_count_tx_queue_list}")
+            print(f"xmit netdevice:remain:{len(self.tx_xmit_list)} "
+                  f"overflow:{self.of_count_tx_xmit_list}")
+            print(f"receive:remain:{len(self.rx_skb_list)} "
+                  f"overflow:{self.of_count_rx_skb_list}")
+
+    def handle_single_event(self, event: dict) -> None:
+        """Handle a single processed event."""
+        name = event['name']
+        if name == 'irq:softirq_exit':
+            self.handle_irq_softirq_exit(event)
+        elif name == 'irq:softirq_entry':
+            self.handle_irq_softirq_entry(event)
+        elif name == 'irq:softirq_raise':
+            self.handle_irq_softirq_raise(event)
+        elif name == 'irq:irq_handler_entry':
+            self.handle_irq_handler_entry(event)
+        elif name == 'irq:irq_handler_exit':
+            self.handle_irq_handler_exit(event)
+        elif name == 'napi:napi_poll':
+            self.handle_napi_poll(event)
+        elif name == 'net:netif_receive_skb':
+            self.handle_netif_receive_skb(event)
+        elif name == 'net:netif_rx':
+            self.handle_netif_rx(event)
+        elif name == 'skb:skb_copy_datagram_iovec':
+            self.handle_skb_copy_datagram_iovec(event)
+        elif name == 'net:net_dev_queue':
+            self.handle_net_dev_queue(event)
+        elif name == 'net:net_dev_xmit':
+            self.handle_net_dev_xmit(event)
+        elif name == 'skb:kfree_skb':
+            self.handle_kfree_skb(event)
+        elif name == 'skb:consume_skb':
+            self.handle_consume_skb(event)
+
+    def process_event(self, sample: perf.sample_event) -> None:
+        """Process events directly on-the-fly."""
+        name = str(sample.evsel)
+        pid = sample.sample_pid
+        if hasattr(self, 'session') and self.session:
+            comm = self.session.find_thread(pid).comm()
+        else:
+            comm = "Unknown"
+        event_data = {
+            'name': name[6:-1] if name.startswith("evsel(") else name,
+            'time': sample.sample_time,
+            'cpu': sample.sample_cpu,
+            'pid': pid,
+            'comm': comm,
+        }
+
+        # Extract specific fields based on event type
+        if name.startswith("evsel(irq:softirq_"):
+            event_data['vec'] = getattr(sample, "vec", 0)
+            # Filter for NET_RX
+            try:
+                if perf.symbol_str("irq:softirq_entry", "vec",  # type: ignore
+                                   event_data['vec']) != "NET_RX":
+                    return
+            except AttributeError:
+                # Fallback if symbol_str not available or fails
+                if event_data['vec'] != 3:  # NET_RX_SOFTIRQ is usually 3
+                    return
+        elif name == "evsel(irq:irq_handler_entry)":
+            event_data['irq'] = getattr(sample, "irq", -1)
+            event_data['irq_name'] = getattr(sample, "name", "[unknown]")
+        elif name == "evsel(irq:irq_handler_exit)":
+            event_data['irq'] = getattr(sample, "irq", -1)
+            event_data['ret'] = getattr(sample, "ret", 0)
+        elif name == "evsel(napi:napi_poll)":
+            event_data['napi'] = getattr(sample, "napi", 0)
+            event_data['dev_name'] = getattr(sample, "dev_name", "[unknown]")
+            event_data['work'] = getattr(sample, "work", 0)
+            event_data['budget'] = getattr(sample, "budget", 0)
+        elif name in ("evsel(net:netif_receive_skb)", "evsel(net:netif_rx)",
+                      "evsel(net:net_dev_queue)"):
+            event_data['skbaddr'] = getattr(sample, "skbaddr", 0)
+            event_data['skblen'] = getattr(sample, "len", 0)
+            event_data['dev_name'] = getattr(sample, "name", "[unknown]")
+        elif name == "evsel(net:net_dev_xmit)":
+            event_data['skbaddr'] = getattr(sample, "skbaddr", 0)
+            event_data['skblen'] = getattr(sample, "len", 0)
+            event_data['rc'] = getattr(sample, "rc", 0)
+            event_data['dev_name'] = getattr(sample, "name", "[unknown]")
+        elif name == "evsel(skb:kfree_skb)":
+            event_data['skbaddr'] = getattr(sample, "skbaddr", 0)
+            event_data['location'] = getattr(sample, "location", 0)
+            event_data['protocol'] = getattr(sample, "protocol", 0)
+            event_data['reason'] = getattr(sample, "reason", 0)
+        elif name == "evsel(skb:consume_skb)":
+            event_data['skbaddr'] = getattr(sample, "skbaddr", 0)
+            event_data['location'] = getattr(sample, "location", 0)
+        elif name == "evsel(skb:skb_copy_datagram_iovec)":
+            event_data['skbaddr'] = getattr(sample, "skbaddr", 0)
+            event_data['skblen'] = getattr(sample, "skblen", 0)
+
+        self.handle_single_event(event_data)
+
+
+if __name__ == "__main__":
+    ap = argparse.ArgumentParser(description="Display a process of packets and processed time.")
+    ap.add_argument("-i", "--input", default="perf.data", help="Input file name")
+    ap.add_argument("tx", nargs="?", help="show only tx chart")
+    ap.add_argument("rx", nargs="?", help="show only rx chart")
+    ap.add_argument("dev", nargs="?", help="show only specified device")
+    ap.add_argument("debug", nargs="?", help="work with debug mode. It shows buffer status.")
+    args = ap.parse_args()
+
+    parsed_args = argparse.Namespace(tx=False, rx=False, dev=None, debug=False, input=args.input)
+
+    for arg in sys.argv[1:]:
+        if arg == 'tx':
+            parsed_args.tx = True
+        elif arg == 'rx':
+            parsed_args.rx = True
+        elif arg.startswith('dev='):
+            parsed_args.dev = arg[4:]
+        elif arg == 'debug':
+            parsed_args.debug = True
+
+    analyzer = NetDevTimesAnalyzer(parsed_args)
+
+    try:
+        session = perf.session(perf.data(parsed_args.input), sample=analyzer.process_event)
+        analyzer.session = session
+        session.process_events()
+        analyzer.print_summary()
+    except KeyboardInterrupt:
+        analyzer.print_summary()
+    except Exception as e:
+        print(f"Error processing events: {e}")
-- 
2.54.0.545.g6539524ca2-goog


