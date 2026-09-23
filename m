Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8556BC9830D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 23:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Vati2L/agrMYnsY7NOrUEt1G7sB1uSh0yKGcv8E8Aeg=; b=ltv7X6w6HTONojrEExblQ2qxBh
	MRGVpIOkni6Dw5fTKBEYdRg56IKWT2FkpEXgKgl5+k4V0jzyfawhlqBXnhYaVGKrkymlHYuccf9cc
	l0o9z848JRpFE7QqrCdg08bP27zAB7nMzk+w1/9kJv/lOFJDUd/o7RRv1rJLA53R26zQoOp5JiDvt
	dDBCt95WcA7+vlFD4JUL8Gm0+wBlULi4iEoRmFLWTY4cUxBoksgW2zccaDUt4dLkpHbA/rXUZLEzX
	+k00AzV9mxfY9HQdKEO4vtO3tZrDldY4URdiTFOwjhxhKNPBH1S1k3GppB4nUSvY1jZXROYqVWv3l
	5wWpdOVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9WVu-00000009iPq-363e;
	Wed, 23 Sep 2026 23:36:34 +0000
Received: from mail-oi1-f208.google.com ([209.85.167.208])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9WVr-00000009iOy-1j93
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 23:36:32 +0000
Received: by mail-oi1-f208.google.com with SMTP id 5614622812f47-4b5bfffcc2dso466069b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 23 Sep 2026 16:36:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790206588; x=1790811388;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :in-reply-to:date:mime-version:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vati2L/agrMYnsY7NOrUEt1G7sB1uSh0yKGcv8E8Aeg=;
        b=vPZ1UQOAG0GrEtXqWcUxgoyqK4VxOuG8UDSgNV7YgUq7xlgTsUhvlymZeNcCgZEKXb
         Lgx/Uy9ddPZQp4p/ef1lD8iWLsllaFiK1CBDr608LkWLEzQEjEuNxALNmqBnK/TE+1Qm
         C4SNWSh+C9jQ+aJVRI4GoIRoAW6+0+555ct8XGB29u8Uzk6wH1LuEbrtiDvM79Q7WGPF
         w6vDnwgZzTU2bfRiEu5Dk96uF83fpTGuekRFXq65n+wY6dsu2Yu8cN2QpUQ/edkZfToV
         5ylB7qygPuxBZ3BMF0/au02x+RTDq3SEpWkM/agRUz2yzn8jOvh6Ff2XL1gSVQHPV7uG
         smAQ==
X-Forwarded-Encrypted: i=1; AKwUvByw8Yd98nPXP2i0fF1unOLD0iUp8BK+epfmwYmpkemWgb/t8Gv22reLTNWGGTeN1UiHF3z8N+M3PFJeIS73DPOc@lists.infradead.org
X-Gm-Message-State: AFuF++l25KYLv8FuG/eaeHql7J83EiwG496avY8uyrdw8HW58bjiqGYF
	64LnmBmyzQO1vLMAbrxnu5sl+rvnEpwO4SbQsV4QFJYEroydl4CO3jLoXCjLrd8PyE/r3V/d3lr
	PPmyQEq14CXxTo9w28FwoW+EgB8HSp/tWEQpFOnUAk593N+c0Qhov/QhY4qU=
MIME-Version: 1.0
X-Received: by 2002:a05:6808:238e:b0:495:f8a5:8797 with SMTP id
 5614622812f47-4d727417502mr691784b6e.0.1790206588603; Wed, 23 Sep 2026
 16:36:28 -0700 (PDT)
Date: Wed, 23 Sep 2026 16:36:28 -0700
In-Reply-To: <6aa866b9.a211d2ce.1a5198.029c.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab4627c.80e1c6cc.1e8e5f.0006.GAE@google.com>
Subject: Re: [syzbot] [wireguard?] [arm?] BUG: workqueue lockup in wg_packet_encrypt_worker
From: syzbot <syzbot+ce2a09d03fdc079a46e9@syzkaller.appspotmail.com>
To: Jason@zx2c4.com, andrew+netdev@lunn.ch, andrew@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, jason@zx2c4.com, kuba@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com, 
	wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260923_163631_523626_8CF56633 
X-CRM114-Status: UNSURE (   4.78  )
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

HEAD commit:    7dc79bb50ab6 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.g=
it for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=3D13047405580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dd8d86a985566711=
3
dashboard link: https://syzkaller.appspot.com/bug?extid=3Dce2a09d03fdc079a4=
6e9
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-=
1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D17c5cd2558000=
0

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4b09bb2b5517/disk-=
7dc79bb5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9e8dab043921/vmlinux-=
7dc79bb5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2151d5f44d15/Ima=
ge-7dc79bb5.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit=
:
Reported-by: syzbot+ce2a09d03fdc079a46e9@syzkaller.appspotmail.com

BUG: workqueue lockup - pool cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 stuck f=
or 38s!
Showing busy workqueues and worker pools:
workqueue events: flags=3D0x100
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D18 refcnt=3D19
    in-flight: 4789:nsim_fib_event_work for 36s ,9:nsim_fib_event_work for =
41s nsim_fib_event_work
    pending: 2*nsim_dev_hwstats_traffic_work, 3*psi_avgs_work, vmstat_sheph=
erd, 2*rht_deferred_worker, psi_avgs_work, free_obj_work, drm_fb_helper_dam=
age_work, 4*ovs_dp_masks_rebalance
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D8 refcnt=3D9
    pending: 2*nsim_dev_hwstats_traffic_work, 6*ovs_dp_masks_rebalance
workqueue events_unbound: flags=3D0x2
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D20 refcnt=3D21
    in-flight: 93:cfg80211_wiphy_work for 40s cfg80211_wiphy_work ,12:nsim_=
dev_trap_report_work for 3s ,5000:nsim_dev_trap_report_work for 5s ,3177:cf=
g80211_wiphy_work for 40s cfg80211_wiphy_work ,13:cfg80211_wiphy_work for 4=
0s cfg80211_wiphy_work ,3281:cfg80211_wiphy_work for 40s cfg80211_wiphy_wor=
k ,3390:cfg80211_wiphy_work for 40s cfg80211_wiphy_work ,1148:linkwatch_eve=
nt for 39s ,2981:cfg80211_wiphy_work for 35s cfg80211_wiphy_work
    pending: nsim_dev_trap_report_work, toggle_allocation_gate, nsim_dev_tr=
ap_report_work, flush_memcg_stats_dwork, macvlan_process_broadcast
workqueue events_power_efficient: flags=3D0x82
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D7 refcnt=3D8
    in-flight: 845:neigh_periodic_work for 2s ,40:gc_worker for 21s
    pending: wg_ratelimiter_gc_entries, 2*neigh_managed_work, do_cache_clea=
n, fb_flashcursor
workqueue events_dfl_long: flags=3D0x2
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D10 refcnt=3D11
    in-flight: 4998:defense_work_handler for 7s
    pending: 9*defense_work_handler
workqueue netns: flags=3D0x6000a
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D4
    in-flight: 3525:cleanup_net for 42s
workqueue mm_percpu_wq: flags=3D0x108
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: vmstat_update
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: vmstat_update
workqueue writeback: flags=3D0x4a
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D4 MAYDAY
    in-flight: 33(RESCUER):wb_workfn for 32s
workqueue mld: flags=3D0x40108
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D51
    in-flight: 4966:mld_ifc_work for 38s
    inactive: mld_ifc_work, mld_dad_work, 2*mld_ifc_work, mld_dad_work, mld=
_ifc_work, 2*mld_dad_work, 7*mld_ifc_work, 2*mld_dad_work, 4*mld_ifc_work, =
mld_dad_work, 6*mld_ifc_work, 4*mld_dad_work, 4*mld_ifc_work, mld_dad_work,=
 8*mld_ifc_work, mld_dad_work, mld_ifc_work, mld_dad_work, mld_ifc_work
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D83
    pending: mld_dad_work
    inactive: 3*mld_dad_work, 7*mld_ifc_work, 3*mld_dad_work, 3*mld_ifc_wor=
k, mld_dad_work, 9*mld_ifc_work, mld_dad_work, mld_ifc_work, mld_dad_work, =
4*mld_ifc_work, mld_dad_work, 3*mld_ifc_work, 2*mld_dad_work, 4*mld_ifc_wor=
k, mld_dad_work, mld_ifc_work, 4*mld_dad_work, 4*mld_ifc_work, 2*mld_dad_wo=
rk, 6*mld_ifc_work, mld_dad_work, 6*mld_ifc_work, 2*mld_dad_work, 3*mld_ifc=
_work, mld_dad_work, 2*mld_ifc_work, mld_dad_work, 2*mld_ifc_work, mld_dad_=
work, mld_ifc_work
workqueue ipv6_addrconf: flags=3D0x6000a
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D282
    in-flight: 1446:addrconf_dad_work for 41s
    inactive: 277*addrconf_dad_work, addrconf_verify_work
workqueue bat_events: flags=3D0x6000a
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D51 MAYDAY
    in-flight: 2854(RESCUER):batadv_tt_purge for 15s
    inactive: 4*batadv_tt_purge, 6*batadv_iv_send_outstanding_bat_ogm_packe=
t, 6*batadv_mcast_mla_update, 6*batadv_iv_send_outstanding_bat_ogm_packet, =
6*batadv_purge_orig, 4*batadv_iv_send_outstanding_bat_ogm_packet, batadv_da=
t_purge, batadv_bla_periodic_work, batadv_dat_purge, batadv_bla_periodic_wo=
rk, batadv_dat_purge, batadv_bla_periodic_work, batadv_dat_purge, batadv_bl=
a_periodic_work, batadv_dat_purge, batadv_bla_periodic_work, batadv_dat_pur=
ge, batadv_bla_periodic_work, batadv_tt_purge
workqueue wg-kex-wg0: flags=3D0x6
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_send_worker
workqueue wg-crypt-wg0: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D4 refcnt=3D5
    in-flight: 4953:wg_packet_encrypt_worker for 38s ,10:wg_packet_tx_worke=
r for 38s
    pending: wg_packet_tx_worker, wg_packet_encrypt_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_encrypt_worker
workqueue wg-crypt-wg1: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D2 refcnt=3D3
    pending: wg_packet_encrypt_worker, wg_packet_tx_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_tx_worker
workqueue wg-kex-wg2: flags=3D0x124
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_receive_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_receive_worker
workqueue wg-crypt-wg2: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D3 refcnt=3D4
    pending: wg_packet_decrypt_worker, wg_packet_encrypt_worker, wg_packet_=
tx_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_tx_worker
workqueue wg-kex-wg0: flags=3D0x124
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_receive_worker
workqueue wg-kex-wg0: flags=3D0x6
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_send_worker
workqueue wg-crypt-wg0: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_decrypt_worker
workqueue wg-kex-wg1: flags=3D0x124
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D2 refcnt=3D3
    in-flight: 866:wg_packet_handshake_receive_worker for 41s
    pending: wg_packet_handshake_receive_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    in-flight: 4476:wg_packet_handshake_receive_worker for 0s
workqueue wg-kex-wg1: flags=3D0x6
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D2
    in-flight: 4997:wg_packet_handshake_send_worker for 3s
workqueue wg-crypt-wg1: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_encrypt_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_tx_worker
workqueue wg-kex-wg2: flags=3D0x124
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_receive_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_receive_worker
workqueue wg-crypt-wg2: flags=3D0x128
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_encrypt_worker
workqueue wg-kex-wg0: flags=3D0x124
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_receive_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    in-flight: 4960:wg_packet_handshake_receive_worker for 8s
workqueue wg-crypt-wg0: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D2 refcnt=3D3
    pending: wg_packet_tx_worker, wg_packet_encrypt_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_tx_worker
workqueue wg-crypt-wg1: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D3 refcnt=3D4
    pending: wg_packet_decrypt_worker, wg_packet_encrypt_worker, wg_packet_=
tx_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D2 refcnt=3D3
    pending: wg_packet_tx_worker, wg_packet_encrypt_worker
workqueue wg-kex-wg0: flags=3D0x6
  pwq 8: cpus=3D0-1 flags=3D0x6 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_send_worker
workqueue wg-crypt-wg0: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D3 refcnt=3D4
    pending: wg_packet_encrypt_worker, wg_packet_tx_worker, wg_packet_decry=
pt_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    in-flight: 4835:wg_packet_encrypt_worker for 11s
workqueue wg-kex-wg2: flags=3D0x124
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_receive_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    in-flight: 26:wg_packet_handshake_receive_worker for 0s
workqueue wg-crypt-wg2: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D2 refcnt=3D3
    pending: wg_packet_encrypt_worker, wg_packet_tx_worker
workqueue wg-kex-wg1: flags=3D0x124
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_receive_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D2 refcnt=3D3
    in-flight: 4999:wg_packet_handshake_receive_worker for 5s
    pending: wg_packet_handshake_receive_worker
workqueue wg-crypt-wg1: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D3 refcnt=3D4
    pending: wg_packet_decrypt_worker, wg_packet_encrypt_worker, wg_packet_=
tx_worker
workqueue wg-kex-wg2: flags=3D0x124
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_receive_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_handshake_receive_worker
workqueue wg-crypt-wg2: flags=3D0x128
  pwq 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 active=3D2 refcnt=3D3
    pending: wg_packet_encrypt_worker, wg_packet_tx_worker
  pwq 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 active=3D1 refcnt=3D2
    pending: wg_packet_tx_worker
pool 2: cpus=3D0 node=3D0 flags=3D0x0 nice=3D0 hung=3D38s workers=3D7 idle:=
 4996
pool 6: cpus=3D1 node=3D0 flags=3D0x0 nice=3D0 hung=3D0s workers=3D7 idle: =
1091 24
pool 8: cpus=3D0-1 flags=3D0x6 nice=3D0 hung=3D2s workers=3D16 manager: 54
Showing backtraces of busy workers in stalled worker pools:
pool 2:
task:kworker/0:4     state:R  running task     stack:0     pid:4953  tgid:4=
953  ppid:2      task_flags:0x4208060 flags:0x00000010
Workqueue: wg-crypt-wg0 wg_packet_encrypt_worker
Call trace:
 __switch_to+0x2b4/0x6e4 arch/arm64/kernel/process.c:775 (T)
 context_switch kernel/sched/core.c:5533 [inline]
 __schedule+0x1370/0x2d80 kernel/sched/core.c:7284
 preempt_schedule_common+0xd4/0x190 kernel/sched/core.c:7463
 preempt_schedule+0x60/0x78 kernel/sched/core.c:7487
 __local_bh_enable_ip+0x20c/0x35c kernel/softirq.c:480
 __raw_spin_unlock_bh include/linux/spinlock_api_smp.h:237 [inline]
 _raw_spin_unlock_bh+0x3c/0x4c kernel/locking/spinlock.c:245
 spin_unlock_bh include/linux/spinlock.h:407 [inline]
 ptr_ring_consume_bh include/linux/ptr_ring.h:399 [inline]
 wg_packet_encrypt_worker+0x25c/0x1290 drivers/net/wireguard/send.c:293
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0x91c/0x1250 kernel/workqueue.c:3479
 worker_thread+0x798/0xbd0 kernel/workqueue.c:3560
 kthread+0x304/0x3d4 kernel/kthread.c:436
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:838
pool 2:
task:kworker/0:3     state:R  running task     stack:0     pid:4789  tgid:4=
789  ppid:2      task_flags:0x4208060 flags:0x00000010
Workqueue: events nsim_fib_event_work
Call trace:
 __switch_to+0x2b4/0x6e4 arch/arm64/kernel/process.c:775 (T)
 context_switch kernel/sched/core.c:5533 [inline]
 __schedule+0x1370/0x2d80 kernel/sched/core.c:7284
 __schedule_loop kernel/sched/core.c:7361 [inline]
 schedule+0x13c/0x20c kernel/sched/core.c:7376
 schedule_timeout+0x13c/0x28c kernel/time/sleep_timeout.c:99
 schedule_timeout_uninterruptible+0x78/0xbc kernel/time/sleep_timeout.c:158
 msleep+0x3c/0x68 kernel/time/sleep_timeout.c:318
 nsim_fib4_rt_add drivers/net/netdevsim/fib.c:369 [inline]
 nsim_fib4_rt_insert drivers/net/netdevsim/fib.c:432 [inline]
 nsim_fib4_event drivers/net/netdevsim/fib.c:464 [inline]
 nsim_fib_event+0x5564/0x60c4 drivers/net/netdevsim/fib.c:884
 nsim_fib_event_work+0x1d8/0x320 drivers/net/netdevsim/fib.c:1493
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0x91c/0x1250 kernel/workqueue.c:3479
 worker_thread+0x798/0xbd0 kernel/workqueue.c:3560
 kthread+0x304/0x3d4 kernel/kthread.c:436
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:838
pool 2:
task:kworker/0:5     state:R  running task     stack:0     pid:4966  tgid:4=
966  ppid:2      task_flags:0x4208060 flags:0x00000010
Workqueue: mld mld_ifc_work
Call trace:
 __switch_to+0x2b4/0x6e4 arch/arm64/kernel/process.c:775 (T)
 context_switch kernel/sched/core.c:5533 [inline]
 __schedule+0x1370/0x2d80 kernel/sched/core.c:7284
 preempt_schedule_common+0xd4/0x190 kernel/sched/core.c:7463
 preempt_schedule+0x60/0x78 kernel/sched/core.c:7487
 __local_bh_enable_ip+0x20c/0x35c kernel/softirq.c:480
 local_bh_enable include/linux/bottom_half.h:33 [inline]
 rcu_read_unlock_bh include/linux/rcupdate.h:923 [inline]
 __dev_queue_xmit+0x14d4/0x2bc0 net/core/dev.c:4961
 dev_queue_xmit include/linux/netdevice.h:3461 [inline]
 neigh_hh_output include/net/neighbour.h:544 [inline]
 neigh_output include/net/neighbour.h:558 [inline]
 ip6_finish_output2+0xd24/0x1b68 net/ipv6/ip6_output.c:138
 __ip6_finish_output net/ipv6/ip6_output.c:-1 [inline]
 ip6_finish_output+0x230/0x618 net/ipv6/ip6_output.c:221
 NF_HOOK_COND include/linux/netfilter.h:314 [inline]
 ip6_output+0x2d0/0x644 net/ipv6/ip6_output.c:248
 dst_output include/net/dst.h:470 [inline]
 NF_HOOK+0x14c/0x464 include/linux/netfilter.h:325
 mld_sendpack+0x7f4/0xfec net/ipv6/mcast.c:1890
 mld_send_cr net/ipv6/mcast.c:2191 [inline]
 mld_ifc_work+0x76c/0x9e4 net/ipv6/mcast.c:2739
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0x91c/0x1250 kernel/workqueue.c:3479
 worker_thread+0x798/0xbd0 kernel/workqueue.c:3560
 kthread+0x304/0x3d4 kernel/kthread.c:436
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:838
pool 2:
task:kworker/0:1     state:R  running task     stack:0     pid:10    tgid:1=
0    ppid:2      task_flags:0x4208060 flags:0x00000010
Workqueue: wg-crypt-wg0 wg_packet_tx_worker
Call trace:
 __switch_to+0x2b4/0x6e4 arch/arm64/kernel/process.c:775 (T)
 context_switch kernel/sched/core.c:5533 [inline]
 __schedule+0x1370/0x2d80 kernel/sched/core.c:7284
 preempt_schedule_common+0xd4/0x190 kernel/sched/core.c:7463
 preempt_schedule+0x60/0x78 kernel/sched/core.c:7487
 __local_bh_enable_ip+0x20c/0x35c kernel/softirq.c:480
 local_bh_enable include/linux/bottom_half.h:33 [inline]
 rcu_read_unlock_bh include/linux/rcupdate.h:923 [inline]
 mod_peer_timer+0x21c/0x25c drivers/net/wireguard/timers.c:38
 wg_timers_data_sent+0xb4/0xc8 drivers/net/wireguard/timers.c:151
 wg_packet_create_data_done drivers/net/wireguard/send.c:257 [inline]
 wg_packet_tx_worker+0x204/0x75c drivers/net/wireguard/send.c:276
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0x91c/0x1250 kernel/workqueue.c:3479
 worker_thread+0x798/0xbd0 kernel/workqueue.c:3560
 kthread+0x304/0x3d4 kernel/kthread.c:436
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:838
pool 2:
task:kworker/0:0     state:R  running task     stack:0     pid:9     tgid:9=
     ppid:2      task_flags:0x4208060 flags:0x00000010
Workqueue: events nsim_fib_event_work
Call trace:
 __switch_to+0x2b4/0x6e4 arch/arm64/kernel/process.c:775 (T)
 context_switch kernel/sched/core.c:5533 [inline]
 __schedule+0x1370/0x2d80 kernel/sched/core.c:7284
 __schedule_loop kernel/sched/core.c:7361 [inline]
 schedule+0x13c/0x20c kernel/sched/core.c:7376
 schedule_timeout+0x13c/0x28c kernel/time/sleep_timeout.c:99
 schedule_timeout_uninterruptible+0x78/0xbc kernel/time/sleep_timeout.c:158
 msleep+0x3c/0x68 kernel/time/sleep_timeout.c:318
 nsim_fib4_rt_add drivers/net/netdevsim/fib.c:369 [inline]
 nsim_fib4_rt_insert drivers/net/netdevsim/fib.c:432 [inline]
 nsim_fib4_event drivers/net/netdevsim/fib.c:464 [inline]
 nsim_fib_event+0x5564/0x60c4 drivers/net/netdevsim/fib.c:884
 nsim_fib_event_work+0x1d8/0x320 drivers/net/netdevsim/fib.c:1493
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0x91c/0x1250 kernel/workqueue.c:3479
 worker_thread+0x798/0xbd0 kernel/workqueue.c:3560
 kthread+0x304/0x3d4 kernel/kthread.c:436
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:838
pool 2:
task:kworker/0:2     state:R  running task     stack:0     pid:866   tgid:8=
66   ppid:2      task_flags:0x4208060 flags:0x00000010
Workqueue: wg-kex-wg1 wg_packet_handshake_receive_worker
Call trace:
 __switch_to+0x2b4/0x6e4 arch/arm64/kernel/process.c:775 (T)
 context_switch kernel/sched/core.c:5533 [inline]
 __schedule+0x1370/0x2d80 kernel/sched/core.c:7284
 preempt_schedule_common+0xd4/0x190 kernel/sched/core.c:7463
 preempt_schedule+0x60/0x78 kernel/sched/core.c:7487
 __local_bh_enable_ip+0x20c/0x35c kernel/softirq.c:480
 local_bh_enable include/linux/bottom_half.h:33 [inline]
 __alloc_skb+0x1c8/0x610 net/core/skbuff.c:699
 alloc_skb include/linux/skbuff.h:1384 [inline]
 wg_socket_send_buffer_to_peer+0x44/0x174 drivers/net/wireguard/socket.c:19=
1
 wg_packet_send_handshake_response+0x168/0x264 drivers/net/wireguard/send.c=
:103
 wg_receive_handshake_packet drivers/net/wireguard/receive.c:154 [inline]
 wg_packet_handshake_receive_worker+0x570/0xcf8 drivers/net/wireguard/recei=
ve.c:213
 process_one_work kernel/workqueue.c:3396 [inline]
 process_scheduled_works+0x91c/0x1250 kernel/workqueue.c:3479
 worker_thread+0x798/0xbd0 kernel/workqueue.c:3560
 kthread+0x304/0x3d4 kernel/kthread.c:436
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:838


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

