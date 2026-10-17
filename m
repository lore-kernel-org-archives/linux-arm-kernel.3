Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29307CCF2C7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Oct 2026 10:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=YuMjLK8gaspxBKXcdrmsYXc+0vOTcsQNYctxqVQSMw8=; b=btrasG7hKuQwUKS0eDwfo9v+Ja
	ArUNZs5xlI+5jVDmd79XGa2opcEShqf3Hk9D70OEh3bp6Cay+xhE+ksNc9BWIs0M4Tq79C+obhzli
	EXO43zoEFFXfwPLIelPSUKjqxCksvDl+EtQeAxNIbUHfxBHWYg8w+Hkhw24SsyH8DlIp+C8E3KUHK
	7ljCRYdzgAfSPM2aZtklpVBuo/pvE7X+DPHrUw+Yj01x/QLBc49OsiBy78o+v0v/WNqmnXxq8rlqi
	TA+i9YJi+pnsHDQ0gxLRDgagXk4hYAYcZ1LHMbXYXOjn82YCreQ4VYvUyqcoN2sGkshGD1ehdvdaK
	yAxgq9xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI1sv-00000004gIo-2s9n;
	Sat, 17 Oct 2026 10:43:29 +0000
Received: from mail-oi1-f198.google.com ([209.85.167.198])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI1ss-00000004gIO-1Cah
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Oct 2026 10:43:27 +0000
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4a7de733fa9so1351569b6e.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 17 Oct 2026 03:43:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792233805; x=1792838605;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YuMjLK8gaspxBKXcdrmsYXc+0vOTcsQNYctxqVQSMw8=;
        b=uvlSiCqXpA1bD0mSGWxeo6/yV4MJysoUI4aAKkrggJl5i+sNqr2CsvXIZZqNc1cSbM
         o2+UqVdWpqK91JQ2XcByraFUS75gxm2wuHf+d7bYt8RIzKjxguYjYqX3aJJaHzgvZ5Ub
         fR7NpfpVcOWej3kcfER1vTz4UUC+aUaFalcMkPvvX4Q3/YGJR80V5mm/qlKHnFMNQuAA
         V5tJMbQpSN+1e8CJol3i4MlG9pLXLFiW/+EMC2xphnJVTH+qnoNTWtw7v/2RQathMwt3
         6OowsnyR216GvVc7FWwOkKviDNHeRJAsEgQ3B+dY0XrHnYNTJXg6KA5QzQZn4/tZSfQy
         mK9g==
X-Forwarded-Encrypted: i=1; AKwUvBwxjT7S4kbt4mzKJQX0OFTOh/QRwUvUPXUNx4fAcTgbYvqcYTvqxLeMICe4Np5lUZQvB+MxEVOTEhvfbbvXYRyf@lists.infradead.org
X-Gm-Message-State: AFq9FYKJDXVEhq+py8EiMeCWP5A0VgcbrXyPgH88trAJnFEU/xN/EdED
	l8BtVuPx2yybeyj1z6+qMsN3n5Hinh0vEKHUAE1kow4FONAiphyPh/HsP10JhU33iSfkWuM/Asd
	RdHSjlzR8ZJoCEmdffAbt8sybniuS5U2sO5vjSjbR3DTe6ov8/QY5T1Ez/8o=
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1823:b0:4f3:e98f:fa1d with SMTP id
 5614622812f47-53cc5b5ba97mr2414087b6e.9.1792233804872; Sat, 17 Oct 2026
 03:43:24 -0700 (PDT)
Date: Sat, 17 Oct 2026 03:43:24 -0700
In-Reply-To: <6aa95fe1.a211d2ce.1a5198.02af.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ad3514c.6814cce4.34c49f.0057.GAE@google.com>
Subject: Re: [syzbot] [arm?] BUG: workqueue lockup in batadv_tt_purge
From: syzbot <syzbot+61b202fdc410840f0198@syzkaller.appspotmail.com>
To: davem@davemloft.net, dsahern@kernel.org, edumazet@google.com, 
	edumazet@kernel.org, fw@strlen.de, herbert@gondor.apana.org.au, 
	horms@kernel.org, idosch@nvidia.com, kuba@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, netfilter-devel@vger.kernel.org, pabeni@redhat.com, 
	pablo@netfilter.org, steffen.klassert@secunet.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_034326_378675_A2D00B33 
X-CRM114-Status: UNSURE (   3.47  )
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

syzbot has found a reproducer for the following issue on:

HEAD commit:    7a19f0cc94ad Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.g=
it for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=3D16fb34e1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D26d6221a572842a=
c
dashboard link: https://syzkaller.appspot.com/bug?extid=3D61b202fdc410840f0=
198
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D11329bd158000=
0

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/296cd4b77dbf/disk-=
7a19f0cc.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e57669ed895f/vmlinux-=
7a19f0cc.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c679c1ad76d4/Ima=
ge-7a19f0cc.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit=
:
Reported-by: syzbot+61b202fdc410840f0198@syzkaller.appspotmail.com

bridge0: received packet on bridge_slave_1 with own address as source addre=
ss (addr:aa:aa:aa:aa:aa:1c, vlan:0)
BUG: workqueue lockup - pool cpus=3D1 node=3D0 flags=3D0x0 nice=3D-20 stuck=
 for 32s!
Showing busy workqueues and worker pools:
workqueue events: flags=3D0x100
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D9 refcnt=3D10
    pending: free_ipc, rht_deferred_worker, 2*nsim_dev_hwstats_traffic_work=
, vmstat_shepherd, 2*psi_avgs_work, 2*ovs_dp_masks_rebalance
  pwq 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 active=3D11 refcnt=3D12
    in-flight: 1503:request_firmware_work_func for 147s
    pending: 3*nsim_dev_hwstats_traffic_work, 2*psi_avgs_work, drm_fb_helpe=
r_damage_work, 4*ovs_dp_masks_rebalance
workqueue events_unbound: flags=3D0x2
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D9 refcnt=3D10
    in-flight: 5092:call_usermodehelper_exec_work for 84s ,13:nsim_dev_trap=
_report_work for 17s ,5097:nsim_dev_trap_report_work for 5s ,196:cfg80211_w=
iphy_work for 25s
    pending: 2*nsim_dev_trap_report_work, flush_memcg_stats_dwork, toggle_a=
llocation_gate, nsim_dev_trap_report_work
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D13 refcnt=3D14
    in-flight: 5096:cfg80211_wiphy_work for 85s cfg80211_wiphy_work ,5095:c=
fg80211_wiphy_work for 90s cfg80211_wiphy_work ,49:cfg80211_wiphy_work for =
93s cfg80211_wiphy_work ,61:cfg80211_wiphy_work for 94s cfg80211_wiphy_work=
 ,12:linkwatch_event for 93s ,1428:cfg80211_wiphy_work for 93s cfg80211_wip=
hy_work ,1214:cfg80211_wiphy_work for 91s cfg80211_wiphy_work
workqueue events_power_efficient: flags=3D0x82
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D6 refcnt=3D7
    in-flight: 1187:neigh_periodic_work for 2s
    pending: 2*neigh_managed_work, fb_flashcursor, gc_worker, wg_ratelimite=
r_gc_entries
workqueue events_dfl_long: flags=3D0x2
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D6 refcnt=3D7
    pending: 6*defense_work_handler
workqueue rcu_gp: flags=3D0x108
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D1 refcnt=3D4 MAYDA=
Y
    pending: process_srcu
workqueue mm_percpu_wq: flags=3D0x108
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D1 refcnt=3D3 MAYDA=
Y
    pending: vmstat_update
  pwq 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 active=3D1 refcnt=3D4 MAYDA=
Y
    pending: mayday_cursor_func, vmstat_update
workqueue writeback: flags=3D0x4a
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D3 MAYDAY
    pending: wb_workfn
workqueue kblockd: flags=3D0x118
  pwq 7: cpus=3D1 node=3D0 flags=3D0x0 nice=3D-20 active=3D1 refcnt=3D2
    pending: blk_mq_timeout_work
workqueue mld: flags=3D0x40108
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D1 refcnt=3D4 MAYDA=
Y
    pending: mld_ifc_work
    inactive: mld_ifc_work
  pwq 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 active=3D1 refcnt=3D97 MAYD=
AY
    in-flight: 2824(RESCUER):mld_ifc_work for 2s
    pending: mayday_cursor_func
    inactive: 3*mld_ifc_work, mld_dad_work, 5*mld_ifc_work, mld_dad_work, 5=
*mld_ifc_work, mld_dad_work, 2*mld_ifc_work, mld_dad_work, 5*mld_ifc_work, =
mld_dad_work, 10*mld_ifc_work, mld_dad_work, 3*mld_ifc_work, mld_dad_work, =
4*mld_ifc_work, 3*mld_dad_work, mld_ifc_work, mld_dad_work, 6*mld_ifc_work,=
 mld_dad_work, 5*mld_ifc_work, mld_dad_work, 11*mld_ifc_work, mld_dad_work,=
 4*mld_ifc_work, mld_dad_work, 5*mld_ifc_work, 2*mld_dad_work, 4*mld_ifc_wo=
rk, 2*mld_dad_work, mld_ifc_work
workqueue ipv6_addrconf: flags=3D0x6000a
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D386
    in-flight: 40:addrconf_dad_work for 94s
    inactive: 382*addrconf_dad_work
workqueue bat_events: flags=3D0x6000a
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D40 MAYDAY
    in-flight: 2857(RESCUER):batadv_tt_purge for 0s
    pending: mayday_cursor_func
    inactive: 3*batadv_iv_send_outstanding_bat_ogm_packet, 2*batadv_purge_o=
rig, 2*batadv_iv_send_outstanding_bat_ogm_packet, batadv_purge_orig, 6*bata=
dv_iv_send_outstanding_bat_ogm_packet, 3*batadv_mcast_mla_update, 2*batadv_=
dat_purge, 2*batadv_bla_periodic_work, batadv_dat_purge, batadv_bla_periodi=
c_work, batadv_dat_purge, batadv_bla_periodic_work, batadv_dat_purge, batad=
v_bla_periodic_work, batadv_tt_purge, 2*batadv_mcast_mla_update, 2*batadv_p=
urge_orig, 2*batadv_tt_purge
workqueue wg-kex-wg0: flags=3D0x124
  pwq 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 active=3D1 refcnt=3D2
    in-flight: 4784:wg_packet_handshake_receive_worker for 47s
workqueue wg-crypt-wg0: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D1 refcnt=3D3 MAYDA=
Y
    pending: wg_packet_encrypt_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 active=3D2 refcnt=3D5 MAYDA=
Y
    pending: wg_packet_tx_worker, wg_packet_encrypt_worker
workqueue wg-crypt-wg1: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D1 refcnt=3D3 MAYDA=
Y
    pending: wg_packet_decrypt_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 active=3D2 refcnt=3D5 MAYDA=
Y
    pending: mayday_cursor_func, wg_packet_decrypt_worker, wg_packet_tx_wor=
ker
workqueue wg-kex-wg2: flags=3D0x124
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D1 refcnt=3D2
    in-flight: 5067:wg_packet_handshake_receive_worker for 30s
  pwq 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 active=3D1 refcnt=3D2
    in-flight: 5074:wg_packet_handshake_receive_worker for 41s
workqueue wg-kex-wg2: flags=3D0x6
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_send_worker
workqueue wg-crypt-wg2: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D2 refcnt=3D4 MAYDA=
Y
    pending: wg_packet_encrypt_worker, wg_packet_tx_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 active=3D3 refcnt=3D6 MAYDA=
Y
    pending: wg_packet_tx_worker, wg_packet_encrypt_worker, wg_packet_decry=
pt_worker
workqueue wg-kex-wg0: flags=3D0x124
  pwq 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_receive_worker
workqueue wg-kex-wg0: flags=3D0x6
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_send_worker
workqueue wg-crypt-wg0: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D2 refcnt=3D4 MAYDA=
Y
    pending: wg_packet_tx_worker, wg_packet_encrypt_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 active=3D3 refcnt=3D6 MAYDA=
Y
    pending: wg_packet_decrypt_worker, wg_packet_tx_worker, wg_packet_encry=
pt_worker
workqueue wg-kex-wg1: flags=3D0x124
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_receive_worker
workqueue wg-crypt-wg1: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D2 refcnt=3D4 MAYDA=
Y
    pending: wg_packet_tx_worker, wg_packet_encrypt_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 active=3D3 refcnt=3D6 MAYDA=
Y
    pending: mayday_cursor_func, wg_packet_decrypt_worker, wg_packet_encryp=
t_worker, wg_packet_tx_worker
workqueue wg-kex-wg2: flags=3D0x124
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D2 refcnt=3D3
    in-flight: 866:wg_packet_handshake_receive_worker for 31s
    pending: wg_packet_handshake_receive_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 active=3D2 refcnt=3D3
    in-flight: 24:wg_packet_handshake_receive_worker for 44s
    pending: wg_packet_handshake_receive_worker
workqueue wg-kex-wg0: flags=3D0x124
  pwq 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_receive_worker
workqueue wg-kex-wg0: flags=3D0x6
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_send_worker
workqueue wg-crypt-wg0: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D1 refcnt=3D3 MAYDA=
Y
    pending: wg_packet_tx_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 active=3D3 refcnt=3D6 MAYDA=
Y
    pending: wg_packet_decrypt_worker, wg_packet_encrypt_worker, wg_packet_=
tx_worker
workqueue wg-kex-wg1: flags=3D0x124
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D2 refcnt=3D3
    in-flight: 4794:wg_packet_handshake_receive_worker for 67s wg_packet_ha=
ndshake_receive_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 active=3D2 refcnt=3D3
    in-flight: 4833:wg_packet_handshake_receive_worker for 47s
    pending: wg_packet_handshake_receive_worker
workqueue wg-kex-wg1: flags=3D0x6
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_send_worker
workqueue wg-crypt-wg1: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D2 refcnt=3D4 MAYDA=
Y
    pending: wg_packet_decrypt_worker, wg_packet_tx_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 active=3D3 refcnt=3D6 MAYDA=
Y
    pending: wg_packet_tx_worker, wg_packet_encrypt_worker, wg_packet_decry=
pt_worker
workqueue wg-kex-wg2: flags=3D0x124
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D2 refcnt=3D3
    in-flight: 5091:wg_packet_handshake_receive_worker for 22s
    pending: wg_packet_handshake_receive_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 active=3D2 refcnt=3D3
    in-flight: 4847:wg_packet_handshake_receive_worker for 41s
    pending: wg_packet_handshake_receive_worker
workqueue wg-crypt-wg2: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D2 refcnt=3D5 MAYDA=
Y
    in-flight: 10:wg_packet_decrypt_worker for 1s
    pending: wg_packet_encrypt_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 active=3D2 refcnt=3D4 MAYDA=
Y
    pending: wg_packet_decrypt_worker, wg_packet_encrypt_worker
workqueue wg-kex-wg0: flags=3D0x124
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D1 refcnt=3D2
    in-flight: 4955:wg_packet_handshake_receive_worker for 5s
  pwq 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_receive_worker
workqueue wg-crypt-wg0: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D1 refcnt=3D3 MAYDA=
Y
    pending: wg_packet_encrypt_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 active=3D3 refcnt=3D6 MAYDA=
Y
    pending: wg_packet_decrypt_worker, wg_packet_tx_worker, wg_packet_encry=
pt_worker
workqueue wg-kex-wg1: flags=3D0x124
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_receive_worker
workqueue wg-kex-wg1: flags=3D0x6
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_send_worker
workqueue wg-crypt-wg1: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D3 refcnt=3D5 MAYDA=
Y
    pending: wg_packet_decrypt_worker, wg_packet_tx_worker, wg_packet_encry=
pt_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 active=3D3 refcnt=3D6 MAYDA=
Y
    pending: wg_packet_tx_worker, wg_packet_encrypt_worker, wg_packet_decry=
pt_worker
workqueue wg-kex-wg2: flags=3D0x124
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D2 refcnt=3D3
    in-flight: 9:wg_packet_handshake_receive_worker for 31s wg_packet_hands=
hake_receive_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 active=3D2 refcnt=3D3
    in-flight: 26:wg_packet_handshake_receive_worker for 47s
    pending: wg_packet_handshake_receive_worker
workqueue wg-kex-wg2: flags=3D0x6
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_send_worker
workqueue wg-crypt-wg2: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 active=3D1 refcnt=3D4 MAYDA=
Y
    pending: wg_packet_decrypt_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 active=3D2 refcnt=3D4 MAYDA=
Y
    pending: wg_packet_decrypt_worker, wg_packet_encrypt_worker
pool 2: cpus=3D0 node=3D0 flags=3D0x2 nice=3D0 hung=3D1s workers=3D8 manage=
r: 5019
pool 6: cpus=3D1 node=3D0 flags=3D0x2 nice=3D0 hung=3D2s workers=3D8 manage=
r: 1091
pool 8: cpus=3D0-1 flags=3D0x6 nice=3D0 hung=3D0s workers=3D14 manager: 509=
9
Showing backtraces of busy workers in stalled worker pools:
pool 7: no worker in running state, cpu=3D1 is busy (nr_workers=3D2 nr_idle=
=3D2)
The pool might have trouble waking an idle worker.
Backtrace of last woken worker:
task:kworker/1:1H    state:R  running task     stack:0     pid:4356  tgid:4=
356  ppid:2      task_flags:0x4208060 flags:0x00000010
Workqueue:  0x0 (kblockd)
Call trace:
 __switch_to+0x2b4/0x6e4 arch/arm64/kernel/process.c:775 (T)
 context_switch kernel/sched/core.c:5533 [inline]
 __schedule+0x135c/0x2b00 kernel/sched/core.c:7284
 __schedule_loop kernel/sched/core.c:7361 [inline]
 schedule+0x13c/0x20c kernel/sched/core.c:7376
 worker_thread+0x924/0xbd0 kernel/workqueue.c:3575
 kthread+0x304/0x3d4 kernel/kthread.c:436
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:854
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 2857 Comm: kworker/R-bat_e Not tainted syzkaller #0 PREE=
MPT=20
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Goo=
gle 09/23/2026
Workqueue: bat_events batadv_tt_purge
pstate: 43400005 (nZcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=3D--)
pc : check_kcov_mode+0x30/0x54 kernel/kcov.c:179
lr : __sanitizer_cov_trace_pc+0x28/0x5c kernel/kcov.c:213
sp : ffff80008f7f6480
x29: ffff80008f7f6480 x28: ffff0000d7c37cdf x27: dfff800000000000
x26: 1fffe0001af86f99 x25: 0000000000000000 x24: 0000000000000001
x23: 0000000000000003 x22: ffff0000d7c37cc8 x21: 00000000fffffffd
x20: ffff0000c989bb00 x19: ffff800085770458 x18: ffff80011b89c000
x17: 0000000000020010 x16: 0038dd8600000000 x15: 0000000000000001
x14: 000000000453af90 x13: 0000000000000002 x12: 0000000000000000
x11: ffff80008f7f6740 x10: 000000000000003f x9 : 0000000000000101
x8 : 0000000000000000 x7 : ffff80008f7f6750 x6 : 0000000000000003
x5 : ffff80008f7f6750 x4 : ffff80008f7f6740 x3 : ffff800085770444
x2 : 00000000fffffffd x1 : ffff0000c989bb00 x0 : 0000000000000002
Call trace:
 check_kcov_mode+0x30/0x54 kernel/kcov.c:179 (P)
 find_match+0x1b4/0xacc net/ipv6/route.c:790
 __find_rr_leaf+0x1d8/0x634 net/ipv6/route.c:873
 find_rr_leaf net/ipv6/route.c:894 [inline]
 rt6_select net/ipv6/route.c:938 [inline]
 fib6_table_lookup+0x3a4/0x8e8 net/ipv6/route.c:2261
 ip6_pol_route+0x224/0xec4 net/ipv6/route.c:2298
 ip6_pol_route_input+0x74/0x98 net/ipv6/route.c:2357
 pol_lookup_func include/net/ip6_fib.h:670 [inline]
 fib6_rule_lookup+0x1a0/0x474 net/ipv6/fib6_rules.c:123
 ip6_route_input_lookup+0xa8/0xdc net/ipv6/route.c:2369
 ip6_route_input+0x578/0x860 net/ipv6/route.c:2672
 ip6_rcv_finish_core+0x200/0x3a4 net/ipv6/ip6_input.c:106
 ip6_rcv_finish+0x120/0x204 net/ipv6/ip6_input.c:117
 ip_sabotage_in+0x1bc/0x220 net/bridge/br_netfilter_hooks.c:988
 nf_hook_entry_hookfn include/linux/netfilter.h:165 [inline]
 nf_hook_slow+0xc8/0x224 net/netfilter/core.c:619
 nf_hook include/linux/netfilter.h:280 [inline]
 NF_HOOK+0x1f0/0x398 include/linux/netfilter.h:323
 ipv6_rcv+0x9c/0xbc net/ipv6/ip6_input.c:351
 __netif_receive_skb_one_core+0xc8/0x110 net/core/dev.c:6297
 __netif_receive_skb+0x34/0x128 net/core/dev.c:6410
 netif_receive_skb_internal net/core/dev.c:6496 [inline]
 netif_receive_skb+0x1e0/0x888 net/core/dev.c:6555
 br_netif_receive_skb+0x138/0x184 net/bridge/br_input.c:30
 NF_HOOK+0xa8/0x3a0 include/linux/netfilter.h:325
 br_pass_frame_up+0x28c/0x41c net/bridge/br_input.c:70
 br_handle_frame_finish+0xed0/0x14c4 net/bridge/br_input.c:-1
 br_nf_hook_thresh+0x344/0x3e8 net/bridge/br_netfilter_hooks.c:-1
 br_nf_pre_routing_finish_ipv6+0x7ac/0xaa4 net/bridge/br_netfilter_ipv6.c:-=
1
 NF_HOOK include/linux/netfilter.h:325 [inline]
 br_nf_pre_routing_ipv6+0x2c4/0x5f8 net/bridge/br_netfilter_ipv6.c:183
 br_nf_pre_routing+0x6e0/0x1168 net/bridge/br_netfilter_hooks.c:513
 nf_hook_entry_hookfn include/linux/netfilter.h:165 [inline]
 nf_hook_bridge_pre net/bridge/br_input.c:291 [inline]
 br_handle_frame+0xeb0/0x10dc net/bridge/br_input.c:451
 __netif_receive_skb_core+0x848/0x2a3c net/core/dev.c:6184
 __netif_receive_skb_one_core+0x70/0x110 net/core/dev.c:6295
 __netif_receive_skb+0x34/0x128 net/core/dev.c:6410
 process_backlog+0x588/0x14e0 net/core/dev.c:6761
 __napi_poll+0xb4/0x328 net/core/dev.c:7830
 napi_poll net/core/dev.c:7893 [inline]
 net_rx_action+0x5b0/0xc14 net/core/dev.c:8050
 handle_softirqs+0x324/0xcbc kernel/softirq.c:645
 __do_softirq+0x14/0x20 kernel/softirq.c:679
 ____do_softirq+0x10/0x1c arch/arm64/kernel/irq.c:78
 call_on_irq_stack+0x30/0x48 arch/arm64/kernel/entry.S:901
 do_softirq_own_stack+0x1c/0x28 arch/arm64/kernel/irq.c:83
 do_softirq+0x90/0xf8 kernel/softirq.c:546
 __local_bh_enable_ip+0x190/0x234 kernel/softirq.c:473
 __raw_spin_unlock_bh include/linux/spinlock_api_smp.h:237 [inline]
 _raw_spin_unlock_bh+0x3c/0x4c kernel/locking/spinlock.c:245
 spin_unlock_bh include/linux/spinlock.h:407 [inline]
 batadv_tt_local_purge+0x274/0x2f0 net/batman-adv/translation-table.c:1402
 batadv_tt_purge+0x44/0x7b4 net/batman-adv/translation-table.c:3753
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0x91c/0x1250 kernel/workqueue.c:3479
 rescuer_thread+0x68c/0xd90 kernel/workqueue.c:3703
 kthread+0x304/0x3d4 kernel/kthread.c:436
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:854
net_ratelimit: 106525 callbacks suppressed
bridge0: received packet on bridge_slave_1 with own address as source addre=
ss (addr:aa:aa:aa:aa:aa:1c, vlan:0)
bridge0: received packet on bridge_slave_1 with own address as source addre=
ss (addr:aa:aa:aa:aa:aa:1c, vlan:0)
bridge0: received packet on bridge_slave_1 with own address as source addre=
ss (addr:aa:aa:aa:aa:aa:1c, vlan:0)
bridge0: received packet on bridge_slave_1 with own address as source addre=
ss (addr:aa:aa:aa:aa:aa:1c, vlan:0)
bridge0: received packet on bridge_slave_1 with own address as source addre=
ss (addr:aa:aa:aa:aa:aa:1c, vlan:0)
bridge0: received packet on bridge_slave_1 with own address as source addre=
ss (addr:aa:aa:aa:aa:aa:1c, vlan:0)
bridge0: received packet on bridge_slave_1 with own address as source addre=
ss (addr:aa:aa:aa:aa:aa:1c, vlan:0)
bridge0: received packet on bridge_slave_1 with own address as source addre=
ss (addr:aa:aa:aa:aa:aa:1c, vlan:0)
bridge0: received packet on bridge_slave_1 with own address as source addre=
ss (addr:aa:aa:aa:aa:aa:1c, vlan:0)
bridge0: received packet on bridge_slave_1 with own address as source addre=
ss (addr:aa:aa:aa:aa:aa:1c, vlan:0)


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

